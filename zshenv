BREW_PREFIX="/opt/homebrew"
export HOMEBREW_PREFIX="${BREW_PREFIX}";
export HOMEBREW_CELLAR="${BREW_PREFIX}/Cellar";
export HOMEBREW_REPOSITORY="${BREW_PREFIX}/Homebrew";
export HOMEBREW_NO_ENV_HINTS=1
PATH="${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:${PATH}";

# dotfile binaries
PATH="${HOME}/.bin:${PATH}"

# ruby via rbenv
PATH="${HOME}/.rbenv/shims:${PATH}"

# node via nodenv
PATH="${HOME}/.nodenv/shims:${PATH}"
PATH="${HOME}/.yarn/bin:${PATH}"

# python via pyenv
PATH="${HOME}/.pyenv/shims:${PATH}"

# cargo binaries
PATH="${HOME}/.cargo/bin:${PATH}"

# mkdir .git/safe for trusted repositories
PATH=".git/safe/../../node_modules/.bin:${PATH}"
PATH=".git/safe/../../bin:${PATH}"

# android sdk
PATH="${HOME}/Library/Android/sdk/platform-tools:${PATH}"
export ANDROID_HOME="${HOME}/Library/Android/sdk"

export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"
export FZF_CTRL_T_COMMAND="rg --files"
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export LESS='-F -i -R -S -w -X -z-4'
export RCRC=~/.rcrc
export RUBYOPT='-W:deprecated'

export -U PATH
