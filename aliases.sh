# Up one level
alias ..="cd .."

# Up 2 levels
alias ...="cd ../../"

# Go to ~/workspace
alias work="cd ~/workspace"

# Go to /var/www
alias www="cd /var/www"

# Alternative to `tail -f`
alias lnav="lnav -c \":enable-word-wrap\" $@"
alias log="${CONFIG_PATH}/bin/lnav -c \":enable-word-wrap\" $@"

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

# Edit
alias E='sudo nano $@'

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

# Fix symfony write permissions
alias fix_sf_permissions='sudo chmod -R g+w var/logs/; sudo chmod -R g+w var/cache/'

# Vagrant alias
alias v='vagrant $@'
make_completion_wrapper vagrant _get_vagrant_autocomplete vagrant
complete -F _get_vagrant_autocomplete v

# Search for something (what, where)
alias ss='grep -Hirn $1 $2 2>/dev/null'

# Git status
alias gs='git status'

# Git stash
alias gsh='git stash'

# Git stash pop
alias gshp='git stash pop'

# Git pull origin {current_branch}
alias gpl="git pull origin `get_git_branch`"

# Git push origin {current_branch}
alias gps="git push origin `get_git_branch`"

# Git add
alias ga="git add $@"

# Git add all
alias gaa="git add --all ."

# Git reset
alias gr="git reset $@"

# Git reset HEAD
alias grh="git reset HEAD"

# Git commit
alias gcm="git commit -m \"`get_git_task_feature`${1//\"/}\""




