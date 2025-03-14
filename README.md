# dotfiles

1. Install Homebrew packages
    ```shell
    brew bundle
    ```

2. Install dotfiles
    ```shell
    RCRC=$HOME/.dotfiles/rcrc rcup
    ```

3. Change shell
    ```shell
    echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
    chsh -s /opt/homebrew/bin/fish
    ```

4. Install neovim plugins
    ```shell
    git clone --depth=1 https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/start/paq-nvim
    vim -c :PaqInstall
    ```
