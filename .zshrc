# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Alias Section 
alias ll="ls -la"
alias update="sudo pacman -Syuu"
alias v="vim"
alias nv="nvim"
alias cp="cp -i" # Prompt comfirmation for copy
alias rm="rm -i" # Prompt comfirmation for copy

# Removing unsed packages (orphans)
alias autoremove="sudo pacman -Rns $(pacman -Qtdq)"

# Copy text to clipboard with xclip
alias xc="xclip -sel c"

# Launch ani-cli with best quality
alias ani="ani-cli -q best"


# Default text editor
EDITOR=/usr/bin/vim
SUDO_EDITOR=/usr/bin/vim
