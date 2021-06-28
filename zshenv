# homebrew
case $(arch) in
 arm64) BREW_PREFIX="/opt/homebrew" ;;
     *) BREW_PREFIX="/usr/local" ;;
esac

export HOMEBREW_PREFIX="${BREW_PREFIX}";
export HOMEBREW_CELLAR="${BREW_PREFIX}/Cellar";
export HOMEBREW_REPOSITORY="${BREW_PREFIX}/Homebrew";
export HOMEBREW_NO_AUTO_UPDATE=1
PATH="${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:${PATH}";

# dotfile bin
PATH="$HOME/.bin:${PATH}"

# ruby via rbenv
PATH="$HOME/.rbenv/shims:${PATH}"

# node via nodenv
PATH="$HOME/.nodenv/shims:${PATH}"

# python via pyenv
PATH="$HOME/.pyenv/shims:${PATH}"

# mkdir .git/safe for trusted repositories
PATH=".git/safe/../../node_modules/.bin:${PATH}"
PATH=".git/safe/../../bin:${PATH}"

export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"
export CLICOLOR=1
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export LESS='-F -i -R -S -w -X -z-4'
export QMK_HOME=~/Developer/qmk
export RCRC=~/.rcrc

export -U PATH
