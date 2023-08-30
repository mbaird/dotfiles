# dotfiles

## Install

Clone dotfiles onto your laptop:

```bash
git clone git@github.com:mbaird/dotfiles.git ~/.dotfiles
```

Install [rcm](https://github.com/thoughtbot/rcm):

```bash
brew tap thoughtbot/formulae
brew install rcm
```

Install the dotfiles:

```bash
env RCRC=$HOME/.dotfiles/rcrc rcup
```

Regenerate iTerm2 theme:

```lua
local M = require 'monochrome.templates.init'; M.render('docs/monochrome.itermcolors')
```

Install Language Servers:

```bash
  gem install solargraph solargraph-rails
  npm install -g typescript typescript-language-server vscode-langservers-extracted
```

## Resources
* [How to profile your zsh startup time](https://esham.io/2018/02/zsh-profiling)
