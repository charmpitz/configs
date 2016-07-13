## README ##

Install
```
git clone git@bitbucket.org:charmpitz/configs.git

cd configs

git clone git://github.com/jimeh/git-aware-prompt.git

grep -q "source $PWD/bash_bootstrap.sh" ~/.bashrc || echo "source $PWD/bash_bootstrap.sh" >> ~/.bashrc

source ~/.bashrc
```
