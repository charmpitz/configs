# Up one level
alias ..="cd .."

# Up 2 levels
alias ...="cd ../../"

# Colored and classified
alias ls='ls -F --color=always'

# Colored and classified
alias dir='dir -F --color=always'

# Detailed
alias ll='ls -l'

# Prompt and verbose
alias cp='cp -iv'

# Prompt
alias rm='rm -i'

# Prompt and verbose
alias mv='mv -iv'

# Colored, ignore case grep
alias grep='grep --color=auto -i'

# Install and automplete
alias I='sudo apt-get install $@'
complete -F _get_packages_autocomplete I

# Remove and autocomplete
alias R='sudo apt-get remove --purge $@'
complete -F _get_packages_remove_autocomplete R

# Update
alias U='sudo apt-get update $@'

# Service
alias S='sudo service $@'
complete -F _get_service_autocomplete S

# Fix web directory permissions 755 644
alias fix_web_permissions='sudo find * -type d -print0 | sudo xargs -0 chmod 0775 && sudo find * -type f -print0 | sudo xargs -0 chmod 0664'

# Search for something (what, where)
alias ss='grep -Hirn $1 $2 2>/dev/null'
