## README ##

1) Set Up Git
```
git config --global user.name "Andrei Pit"
git config --global user.email "charmpitz@gmail.com"
```

2) Add ssh key
```
cat ~/.ssh/id_rsa.pub | xclip -sel clip
```

3) Install
```
git clone git@bitbucket.org:charmpitz/configs.git

cd configs

composer global require stecman/composer-bash-completion-plugin dev-master

grep -q "source $PWD/bootstrap.sh" ~/.bashrc || echo "source $PWD/bootstrap.sh" >> ~/.bashrc

source ~/.bashrc
```
