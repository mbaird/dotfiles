if status is-interactive
  set fish_greeting

  set fish_autosuggestion_enabled 0

  set __fish_git_prompt_showdirtystate 'yes'
  set __fish_git_prompt_char_cleanstate ""
  set __fish_git_prompt_char_untrackedfiles ""
  set __fish_git_prompt_char_stagedstate ""
  set __fish_git_prompt_char_conflictedstate ""

  fish_config theme choose custom
end

# homebrew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
set -x HOMEBREW_NO_ENV_HINTS 1

# nvim
fish_add_path $HOME/.local/share/bob/nvim-bin

# mise
set -x MISE_DATA_DIR $HOME/.mise

# `git trust`
set -x PATH ./.git/safe/../../bin $PATH

# `git jump`
fish_add_path /opt/homebrew/share/git-core/contrib/git-jump

# scripts
set -x PATH $HOME/.bin $PATH

# 1password ssh
if test -z "$SSH_TTY"
  set -x SSH_AUTH_SOCK $HOME/.1password/agent.sock
end

set -x EDITOR nvim
set -x VISUAL $EDITOR
set -x LESS "-F -i -R -S -w -X -z-4"
set -x GOPATH $HOME/.go
set -x MANPAGER "nvim +Man!"

alias vim nvim
alias j z
