# Up one level
alias ..="cd .."

# Up 2 levels
alias ...="cd ../../"

# Go to ~/workspace
alias work="cd ~/workspace"

# Go to /var/www
alias www="cd /var/www"

# Command to open the create shortcut window
alias create_shortcut="gnome-desktop-item-edit ~/.local/share/applications --create-new"

# Alternative to `tail -f`
alias lnav="${CONFIG_PATH}/lnav/lnav -c ":enable-word-wrap" $@"

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

# Colored, ignore case and show line number by default
alias grep='grep --color=auto -in'

# Edit
alias E='sudo nano $@'

# Install and automplete
alias I='sudo apt-get install $@'
complete -F _get_packages_autocomplete I

# Remove and autocomplete
alias R='sudo apt-get remove --purge $@'
complete -F _get_packages_autocomplete R

# Vagrant alias
alias v='vagrant $@'
make_completion_wrapper _vagrant _get_vagrant_autocomplete vagrant
complete -F _get_vagrant_autocomplete v
