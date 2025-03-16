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
set -gx FZF_DEFAULT_OPTS "--color=fg:-1,bg:-1,hl:magenta,fg+:green,bg+:-1,hl+:magenta,info:-1,prompt:-1,pointer:-1,marker:red,spinner:-1,header:-1"
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx PAGER less
set -gx LESS -F -i -R -S -w -X -z-4

alias vim nvim
alias j z

# theme
set fish_color_normal normal
set fish_color_command green
set fish_color_quote yellow
set fish_color_redirection yellow
set fish_color_end magenta
set fish_color_error red
set fish_color_param normal
set fish_color_comment blue
set fish_color_match --background=brblue
set fish_color_search_match bryellow --background=brblack
set fish_color_selection normal --background=bryellow
set fish_color_history_current --bold
set fish_color_operator brcyan
set fish_color_escape brcyan
set fish_color_cwd green
set fish_color_valid_path normal
set fish_color_cwd_root red
set fish_color_user blue
set fish_color_autosuggestion blue
set fish_pager_color_completion normal
set fish_color_host normal
set fish_pager_color_description yellow -i
set fish_color_cancel -r
set fish_pager_color_prefix magenta
set fish_pager_color_progress brcyan
set fish_pager_color_selected_background -r
set fish_color_option cyan
set fish_color_keyword normal
set fish_color_host_remote yellow
set fish_color_status red
