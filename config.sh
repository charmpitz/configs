# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# Force color prompt
force_color_prompt=yes

# Add $HOME/bin to the PATH
export PATH=$PATH:$HOME/bin

# Add $CONFIG_PATH to the PATH
export PATH=$PATH:$CONFIG_PATH/bin

# Add composer's general bin directory to the PATH
PATH=$PATH:~/.composer/vendor/bin

# Bash PS1
export PS1="[⚬ \t ⚬ \[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[34m\]\w\[\e[m\]] \[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[33m\]⚡\[\e[m\] "
