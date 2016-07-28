# Force color prompt
force_color_prompt=yes

# Add $HOME/bin to the PATH
export PATH=$PATH:$HOME/bin

# Add $CONFIG_PATH to the PATH
export PATH=$PATH:$CONFIG_PATH/bin

# Git Prompt variable
PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"

# PS1 Variables
RED="\[\e[38;5;9m\]"  # Red
GREEN="\[\e[38;5;2m\]"  # Green
YELLOW="\[\e[38;5;142m\]"  # Yellow
BLUE="\[\e[38;5;6m\]"  # Blue
RESET="\[\e[0m\]"

USER="$YELLOW\u"
HOST="$YELLOW\h"
DIR="$BLUE\W"

export PS1="$RED[$USER@$HOST $DIR$RED] $GREEN$GIT_BRANCH\$ $RESET"