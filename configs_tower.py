#!/usr/bin/env python

import yaml
import paramiko
import sys
import socket

class Print:
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    END = '\033[0m'

    @classmethod
    def red(cls, s): print(cls.RED + s + cls.END)

    @classmethod
    def blue(cls, s): print(cls.BLUE + s + cls.END)

    @classmethod
    def green(cls, s): print(cls.GREEN + s + cls.END)

    @classmethod
    def yellow(cls, s): print(cls.YELLOW + s + cls.END)

    @classmethod
    def purple(cls, s): print(cls.PURPLE + s + cls.END)

class ConfigTower:
    # Machines data
    machines = None
    # Repo Url
    repository = None
    # Deployment key
    dpl_key = None

    def __init__(self, config_file):
        # Read the yml
        config = self.read_config(config_file)
        # Set the properties
        self.machines = config["machines"]
        self.repository = config["repository"]
        self.dpl_key = config["deployment_key"]

    # Read from the config file
    def read_config(self, config_file):
        with open(config_file, 'r') as stream:
            try:
                config = yaml.load(stream)
                Print.purple('Config file was imported with success.')
            except yaml.YAMLError as exc:
                Print.red(exc)
                sys.exit()
        return config

    def execute(self):
        for mcfg in self.machines:
            try:
                machine = self.Machine(
                    mcfg["hostname"],
                    mcfg["username"],
                    mcfg["password"],
                    mcfg["ssh_key"],
                    mcfg["path"],
                )
                machine.connect()
                # Check if already installed
                if machine.path_exists() == True:
                    # Update
                    Print.yellow(machine.hostname + ': Repository already exists. Updating..')
                    machine.update_repo()
                else:
                    # Install
                    Print.yellow(machine.hostname + ': Repository folder not found. Cloning..')
                    dpl_tmp_path = '/tmp/dpl_key'
                    machine.copy_dpl_key(self.dpl_key, dpl_tmp_path)
                    machine.clone_repo(self.repository, dpl_tmp_path)
                    machine.rm_dpl_key(dpl_tmp_path)
                    Print.green(machine.hostname + ': Repository cloned successfully.')
            except paramiko.AuthenticationException as exc:
                Print.red(machine.hostname + ': Authentication failed.')
                sys.exit()
            except paramiko.BadHostKeyException as exc:
                Print.red(machine.hostname + ': Host key could not be verified.')
                sys.exit()
            except paramiko.SSHException as exc:
                Print.red(machine.hostname + ': Something went wrong.')
                print exc
                sys.exit()
            finally:
                machine.disconnect()
        Print.purple('Everything went accordingly.')


    class Machine:
        # SSH connection service
        ssh = None
        # Connection credentials
        hostname = None
        username = None
        password = None
        ssh_key = None
        path = None

        def __init__(self, hostname, username, password, ssh_key, path):
            self.hostname = hostname
            self.username = username
            self.password = password
            self.ssh_key = ssh_key
            self.path = path

        # Connect to the machine
        def connect(self):
            self.ssh = paramiko.SSHClient()
            self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            self.ssh.connect(
                self.hostname,
                username=self.username,
                password=self.password,
                key_filename=self.ssh_key
            )
            Print.blue('Connected to ' + self.hostname)

        # Disconnect from the machine
        def disconnect(self):
            self.ssh.close()
            Print.blue('Connection to ' + self.hostname + ' closed.')

        # Check if the repository path exists on the machine
        def path_exists(self):
            stdin, stdout, stderr = self.ssh.exec_command('if [ -d "' + self.path + '" ]; then echo "1"; else echo "0"; fi')
            return int(stdout.readline()) == 1

        # Updates the repo from the path
        def update_repo(self):
            self.ssh.exec_command('cd ' + self.path + '; git pull origin master;');

        # Copying the dpl_key to temp
        def copy_dpl_key(self, dpl_key, dpl_tmp_path):
            # Open a channel for file transfer and add the dpl_key
            sftp = self.ssh.open_sftp()
            sftp.put(dpl_key, dpl_tmp_path)
            sftp.close()
            # Set the right permissions
            self.ssh.exec_command('chmod 600 ' + dpl_tmp_path)

        # Removes tmp dpl_key
        def rm_dpl_key(self, dpl_tmp_path):
            self.ssh.exec_command('rm -f ' + dpl_tmp_path)

        # Clones the repo
        def clone_repo(self, repository, dpl_key_path):
            stdin, stdout, stderr = self.ssh.exec_command('ssh-agent bash -c \'ssh-add ' + dpl_key_path + '; git clone ' + repository +'\' ' + self.path)
            # Waits for the command to finish
            result = stdout.channel.recv_exit_status()


ConfigTower('configs.yml').execute()
