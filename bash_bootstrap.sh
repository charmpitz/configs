# Paths
CONFIG_PATH=`dirname "$BASH_SOURCE"`

# Colors
black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# Include variables and custom configs
source $CONFIG_PATH/bash_config.sh

# Include functions
source $CONFIG_PATH/bash_functions.sh

# Include custom aliases
source $CONFIG_PATH/bash_aliases.sh

# Include system bash completion
[ -r /etc/bash_completion ] && source /etc/bash_completion

# Include git completion
[ -r $CONFIG_PATH/git_completion.bash ] && source $CONFIG_PATH/git_completion.bash

# Include composer completion
[ -r $CONFIG_PATH/composer_completion.bash ] && source $CONFIG_PATH/composer_completion.bash

