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

# Git Prompt variable
PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"

# PS1 Variables
BOLD="\e[1m"
RED="\[\e[38;5;196m\]"  # Red
GREEN="\[\e[38;5;70m\]"  # Green
YELLOW="\[\e[38;5;142m\]"  # Yellow
BLUE="\[\e[38;5;30m\]"  # Blue
RESET="\[\e[0m\]"

XXX_TIME="\t$RESET"
XXX_USER="$BOLD$YELLOW\u"
XXX_HOST="$BOLD$YELLOW\h$RESET"
XXX_DIR="$BOLD$BLUE\W$RESET"
XXX_VAGRANT=""

if [[ $USER == 'vagrant' ]]; 
then
	export PS1="[$bldylw ⚒ ⚒ ⚒ $XXX_USER @ $XXX_HOST $bldylw ⚒ ⚒ ⚒ $RESET $XXX_DIR ] $BOLD$GREEN\$GIT_BRANCH$bldylw ⚡ $RESET"
else
	export PS1="[$XXX_TIME $XXX_USER@$XXX_HOST $BLUE$XXX_DIR ] $BOLD$GREEN\$GIT_BRANCH$bldylw ⚡ $RESET"
fi

