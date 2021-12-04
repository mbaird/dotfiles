# Reload env
source ~/.zshenv

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
[[ $SSH_CONNECTION ]] && local remote='%F{red}${HOST:l}%f '
PROMPT="${remote}%{%}%~%{%f%} %F{white}❯%f "
RPROMPT='%{%F{242}%}${vcs_info_msg_0_}%{%f%}'

# fuzzy finder
source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh"
source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"

# Completion
fpath=(
  $HOMEBREW_PREFIX/share/zsh/site-functions
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
bindkey '^b' backward-word
bindkey '^w' forward-word
bindkey '^[[3~' delete-char

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,normal

setopt noclobber

# Aliases
alias l="ls -Alhp"
alias mkdir="mkdir -p"
alias dev="cd ~/Developer"
alias web="cd ~/Developer/web"
alias t="$EDITOR ~/.today"
alias vim="nvim"
alias dot="cd ~/.dotfiles"
alias batt="pmset -g batt | rg -o --pcre2 '([0-9]+\%).*' | cut -f3 -d' '"
