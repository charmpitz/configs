## README

### Features
- Git branch support
- Shared history between sessions
- Colored syntax on `grep` usage
- Confirmation on removing files
- Improved auto-completions
- Aliases

### Installation
```
sudo apt-get install bash-completion

cd ~/
git clone git@github.com:charmpitz/configs.git
cd configs
grep -q "source $PWD/bootstrap.sh" ~/.bashrc || echo "source $PWD/bootstrap.sh" >> ~/.bashrc
source ~/.bashrc
```


### How to check for complete functions
http://unix.stackexchange.com/questions/224227/how-do-you-make-an-alias-or-function-that-retains-tab-completion?rq=1

### How to see a function definition
http://stackoverflow.com/questions/6916856/can-bash-show-a-functions-definition
