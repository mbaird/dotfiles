# Prompt with VCS
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' formats "%b%u"
zstyle ':vcs_info:git*' actionformats "%b|%a"

autoload add-zsh-hook
add-zsh-hook precmd vcs_info

setopt prompt_subst
PROMPT="%{%}%~%{%f%} ❯ "
RPROMPT='%{%F{242}%}${vcs_info_msg_0_}%{%f%}'

# fuzzy finder
source "/usr/local/opt/fzf/shell/completion.zsh"
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Completion
fpath=(
  /usr/local/share/zsh/site-functions
  $fpath
)

autoload -Uz compinit

if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;

# g is for git
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}
compdef g=git

# Keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[[3~' delete-char

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Aliases
alias l="ls -Alhp"
alias mkdir="mkdir -p"
alias dev="cd ~/Developer"
alias web="cd ~/Developer/web"
alias t="$EDITOR ~/.today"
alias vim="nvim"
alias dot="cd ~/.dotfiles"
alias batt="pmset -g batt | rg -o --pcre2 '([0-9]+\%).*' | cut -f3 -d' '"

# dotfile bin
PATH="$HOME/.bin:${PATH}"

# Homebrew
PATH="/usr/local/sbin:${PATH}"

# ruby via rbenv
PATH="$HOME/.rbenv/shims:${PATH}"

# node via nodenv
PATH="$HOME/.nodenv/shims:${PATH}"

# python via pyenv
PATH="$HOME/.pyenv/shims:${PATH}"

# mkdir .git/safe for trusted repositories
PATH=".git/safe/../../node_modules/.bin:${PATH}"
PATH=".git/safe/../../bin:${PATH}"

export -U PATH
