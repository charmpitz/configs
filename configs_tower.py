#!/usr/bin/env python

import yaml
import paramiko

# Used for coloring
class PrintInColor:
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    END = '\033[0m'

    @classmethod
    def red(cls, s):
        print(cls.RED + s + cls.END)

    @classmethod
    def blue(cls, s):
        print(cls.BLUE + s + cls.END)

    @classmethod
    def green(cls, s):
        print(cls.GREEN + s + cls.END)

    @classmethod
    def yellow(cls, s):
        print(cls.YELLOW + s + cls.END)

    @classmethod
    def purple(cls, s):
        print(cls.PURPLE + s + cls.END)

# Read from the config file
with open("configs.yaml", 'r') as stream:
    try:
        config = yaml.load(stream)
        PrintInColor.purple('Config file was imported with success.')
    except yaml.YAMLError as exc:
        PrintInColor.red(exc)

# Iterate through the config.machines
for machine in config["machines"]:
    # Connect to the machine
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(
            machine["hostname"],
            username=machine["username"],
            password=machine["password"],
            key_filename=machine["ssh_key"]
        )
        PrintInColor.blue('Connected to ' + machine["hostname"])
        stdin, stdout, stderr = ssh.exec_command('if [ -d "' + machine["path"] + '" ]; then echo "1"; else echo "0"; fi')
        fexists = stdout.readline()

        # Verify if the config is already installed
        if fexists == 1:
            PrintInColor.yellow(machine["hostname"] + ': Repository already installed. Updating..')
            stdin, stdout, stderr = ssh.exec_command('cd ' + machine["path"] + '; git pull origin master;');
        else:
            PrintInColor.yellow(machine["hostname"] + ': Repository folder not found. Installing..')

            transport = ssh.get_transport()
            with transport.open_channel(kind='session') as channel:
                file_data = open(config["repository"]["ssh_key"], 'rb').read()
                # Make sure .ssh folder exists
                channel.exec_command('mkdir /home/'+ machine["username"] + '/.ssh')
                # Copying the deployment key
                channel.exec_command('cat > /home/'+ machine["username"] + '/configs_deployment_key')
                # Setting the permissions
                channel.exec_command('chmod 600 /home/'+ machine["username"] + '/configs_deployment_key')
                # Updating config file
                channel.sendall(file_data)

            stdin, stdout, stderr = ssh.exec_command('git clone ' + config["repository"]["url"] + ' ' + machine["path"])

        PrintInColor.green('Connection to ' + machine["hostname"] + ' closed.')
        ssh.close()
    except paramiko.SSHException as exc:
        PrintInColor.red(machine.hostname + ': Could not connect')
    except paramiko.AuthenticationException as exc:
        PrintInColor.red(machine.hostname + ': Authentication failed')
    except paramiko.BadHostKeyException as exc:
        PrintInColor.red(machine.hostname + ': Host key could not be verified')

PrintInColor.purple('Everything went well.')


    # If if is not installed download the config

    # Return a success/fail message in the command line
