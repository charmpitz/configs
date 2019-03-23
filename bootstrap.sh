# Path of configuration folder
CONFIG_PATH=`dirname "$BASH_SOURCE"`


# Include Colors
source $CONFIG_PATH/colors.sh

# Include variables and custom configs
source $CONFIG_PATH/config.sh

# Include code completions
source $CONFIG_PATH/completions.sh

# Include functions
source $CONFIG_PATH/functions.sh

# Include custom aliases
source $CONFIG_PATH/aliases.sh
