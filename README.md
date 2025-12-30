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