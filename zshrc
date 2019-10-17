# Load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

setopt autocd

# Colours
autoload -U colors
colors

export CLICOLOR=1

# Keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[[3~' delete-char

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# Completion
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)
autoload -U compinit
compinit

compdef g=git

# fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

source "/usr/local/opt/fzf/shell/completion.zsh"
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Path
# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH"

# load rbenv if available
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../node_modules/.bin:$PATH"
PATH=".git/safe/../../bin:$PATH"

# add homebrew python to path
PATH="/usr/local/opt/python/libexec/bin:$PATH"

export -U PATH

# Aliases
alias l="ls -l"
alias ll="ls -al"
alias lh="ls -Alh"
alias mkdir="mkdir -p"
alias dev="cd $DEV"
alias web="cd $DEV/web"
alias be="bundle exec"
alias t="$EDITOR ~/.today"
alias vim="nvim"
alias v="nvim"
alias dot="cd ~/.dotfiles"

# Show remaining battery time
alias batt="pmset -g batt | rg -o --pcre2 '([0-9]+\%).*' | cut -f3 -d' '"

# Prompt
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
