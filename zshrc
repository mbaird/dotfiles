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

setopt hist_ignore_all_dups inc_append_history
HISTSIZE=10000
SAVEHIST=10000

# Prevent overwriting files with `>` operator
setopt noclobber

source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh"
source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"

source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

autoload -Uz compinit
compinit -C;

g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}
compdef g=git

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey '^b' backward-word
bindkey '^w' forward-word

export FZF_DEFAULT_OPTS="--color=bg+:#131313,bg:#131313,border:#9a9a9a,spinner:#c1c1c1,hl:#8abae1,fg:#9a9a9a,header:#fc6a5d,info:#ffffff,pointer:#fc6a5d,marker:#ffffff,fg+:#ffffff,prompt:#c1c1c1,hl+:#8abae1"

# Enable 1Password SSH agent
#
# Only set SSH_AUTH_SOCK for local sessions (SSH_TTY is unset); if SSH_TTY is set, assume that it's
# a remote session, and that SSH agent forwarding is active, so leave SSH_AUTH_SOCK alone
if [ -z "$SSH_TTY" ]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

alias dev="cd ~/Developer"
alias t="$EDITOR ~/.notes/today.md"
alias vim="nvim"
alias dot="cd ~/.dotfiles"
