## README ##

### Dependencies ###
Make sure you have bash-completion installed
```sh
sudo apt-get install bash-completion
```

### Installation
```
cd ~/
git clone git@bitbucket.org:charmpitz/configs.git
cd configs
grep -q "source $PWD/bootstrap.sh" ~/.bashrc || echo "source $PWD/bootstrap.sh" >> ~/.bashrc
source ~/.bashrc
```


### How to check for complete functions
http://unix.stackexchange.com/questions/224227/how-do-you-make-an-alias-or-function-that-retains-tab-completion?rq=1

### How to see a function definition
http://stackoverflow.com/questions/6916856/can-bash-show-a-functions-definition
