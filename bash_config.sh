# Force color prompt
force_color_prompt=yes

# Add $HOME/bin to the PATH
export PATH=$PATH:$HOME/bin

# Custom colored PS1 with Git info
export GITAWAREPROMPT=${CONFIG_PATH}/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\[\e[38;5;9m\][\[$(tput sgr0)\]\[\e[38;5;142m\]\u@\h\[$(tput sgr0)\]\[\e[38;5;15m\] \[$(tput sgr0)\]\[\e[38;5;6m\]\W\[$(tput sgr0)\]\[\e[38;5;9m\]]\[$(tput sgr0)\]\[\e[38;5;15m\] \[$(tput sgr0)\]\[\e[38;5;2m\]\$git_branch\$\[$(tput sgr0)\]\[\e[38;5;15m\] \[$(tput sgr0)\]"