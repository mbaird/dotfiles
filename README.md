dotfiles
==============

Install
-------

Clone dotfiles onto your laptop:

    git clone git@github.com:mbaird/dotfiles.git ~/.dotfiles

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/.dotfiles/rcrc rcup