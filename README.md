dotfiles-local
==============

Install
-------

Clone dotfiles onto your laptop:
	
    git clone git@github.com:thoughtbot/dotfiles.git ~/.dotfiles
    git clone git@github.com:mbaird/dotfiles.git ~/.dotfiles-local

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/.dotfiles-local/rcrc rcup
