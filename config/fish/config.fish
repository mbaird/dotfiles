if status is-interactive
  set fish_greeting ""

  set -g fish_autosuggestion_enabled 0

  set -g __fish_git_prompt_showdirtystate 'yes'
  set -g __fish_git_prompt_char_cleanstate ""
  set -g __fish_git_prompt_char_untrackedfiles ""
  set -g __fish_git_prompt_char_stagedstate ""
  set -g __fish_git_prompt_char_conflictedstate ""
end

# homebrew
fish_add_path /opt/homebrew/bin
set -gx HOMEBREW_NO_ENV_HINTS 1

# mise
set -gx MISE_DATA_DIR "~/.mise"

# `git trust`
set PATH ./.git/safe/../../bin $PATH

set -gx FZF_DEFAULT_COMMAND fd --hidden --type file --color never --exclude .git
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx PAGER less
set -gx LESS -F -i -R -S -w -X -z-4
set -gx RUBYOPT -W:deprecated

alias vim nvim
alias j z
