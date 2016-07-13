CONFIG_PATH=`dirname "$BASH_SOURCE"`

# Include variables and custom configs
source $CONFIG_PATH/bash_config.sh

# Include custom aliases
source $CONFIG_PATH/bash_aliases.sh

# Include system bash completion
[ -r /etc/bash_completion ] && source /etc/bash_completion

# Include git completion
[ -r $CONFIG_PATH/git_completion.bash ] && source $CONFIG_PATH/git_completion.bash
