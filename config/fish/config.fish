if status is-interactive
  set fish_greeting

  set fish_autosuggestion_enabled 0

  set __fish_git_prompt_showdirtystate 'yes'
  set __fish_git_prompt_char_cleanstate ""
  set __fish_git_prompt_char_untrackedfiles ""
  set __fish_git_prompt_char_stagedstate ""
  set __fish_git_prompt_char_conflictedstate ""
end

# homebrew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
set -x HOMEBREW_NO_ENV_HINTS 1

# mise
set -x MISE_DATA_DIR $HOME/.mise

# `git trust`
set -x PATH ./.git/safe/../../bin $PATH

# scripts
set -x PATH $HOME/.bin $PATH

# 1password ssh
if test -z "$SSH_TTY"
  set -x SSH_AUTH_SOCK $HOME/.1password/agent.sock
end

# fzf
set -x FZF_DEFAULT_COMMAND fd --hidden --type file --color never --exclude .git

set -x EDITOR nvim
set -x VISUAL $EDITOR
set -x LESS -F -i -R -S -w -X -z-4

alias vim nvim
alias j z
