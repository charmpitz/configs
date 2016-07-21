# Up one level
alias ..="cd .."

# Up 2 levels
alias ...="cd ../../"

# Command to open the create shortcut window
alias create_shortcut="gnome-desktop-item-edit ~/.local/share/applications --create-new"

# Alternative to `tail -f`
alias log="${CONFIG_PATH}/lnav/lnav -c ":enable-word-wrap" $@"

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

# Install
alias I='sudo apt-get install $@'

# Remove
alias R='sudo apt-get remove --purge $@'

# Edit
alias E='sudo nano $@'
