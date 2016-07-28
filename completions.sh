# Include system bash completion
[ -r /etc/bash_completion ] && source /etc/bash_completion

# Include git completion
[ -r $CONFIG_PATH/git_completion.bash ] && source $CONFIG_PATH/git.bash

# Include composer completion
[ -r $CONFIG_PATH/composer_completion.bash ] && source $CONFIG_PATH/composer.bash