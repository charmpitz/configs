# Include system bash completion
[ -r /etc/bash_completion ] && source /etc/bash_completion

# Include git completion
[ -r $CONFIG_PATH/completions/git.bash ] && source $CONFIG_PATH/completions/git.bash

# Include composer completion
[ -r $CONFIG_PATH/completions/composer.bash ] && source $CONFIG_PATH/completions/composer.bash