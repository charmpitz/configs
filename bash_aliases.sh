# Up one level
alias ..="cd .."

# Up 2 levels
alias ...="cd ../../"

# Command to open the create shortcut window
alias create_shortcut="gnome-desktop-item-edit ~/.local/share/applications --create-new"

# Alternative to `tail -f`
alias log="${CONFIG_PATH}/lnav/lnav -c ":enable-word-wrap" $@"