#####################################################################
# Oh My Zsh Section
#####################################################################
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh

#####################################################################
# Options Section
#####################################################################
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space

autoload -Uz compinit && compinit                               # Enable auto-completion system

zstyle ':completion:*' menu select                              # Autocompletion with menu, press Tab twice to activate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

#####################################################################
# Plugins
#####################################################################
plugins=(
	zsh-syntax-highlighting
	zsh-history-substring-search
	zsh-autosuggestions
)
# Special option for history-substring-search
# bind UP and DOWN arrow keys to history substring search
#zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

################################################################
#  Aliases
################################################################
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Listing
alias ll="ls -al --color=auto"
alias lh="ls -lah"
alias ls="ls --color=auto"

alias grep="grep --colour=auto"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"

alias g="git"
