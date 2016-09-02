# Include system bash completion
[ -r /etc/bash_completion ] && source /etc/bash_completion

# Include git completion
source $CONFIG_PATH/completions/git.bash

# Include symfony, composer, phpspec, behat completion
source $CONFIG_PATH/completions/symfony.bash

# Include phpunit completion
source $CONFIG_PATH/completions/phpunit.bash
