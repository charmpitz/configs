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
GREEN="\[\e[38;5;2m\]"  # Green
YELLOW="\[\e[38;5;142m\]"  # Yellow
BLUE="\[\e[38;5;30m\]"  # Blue
RESET="\[\e[0m\]"

PS1_TIME="⚬ \t ⚬$RESET"
PS1_USER="$BOLD$YELLOW\u"
PS1_HOST="$BOLD$YELLOW\h$RESET"
PS1_DIR="$BOLD$BLUE\W$RESET"
PS1_VAGRANT=""

if [[ $USER == 'vagrant' ]]; then
	PS1_VAGRANT=" $bldylw ⚒⚒⚒ $RESET "
fi

export PS1="$PS1_VAGRANT$PS1_TIME $PS1_USER@$PS1_HOST $BLUE$PS1_DIR $GREEN\$GIT_BRANCH$bldylw ⚡ $RESET"
