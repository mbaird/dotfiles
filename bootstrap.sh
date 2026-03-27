#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

info() {
  printf "\033[0;34m%s\033[0m\n" "$1"
}

case "$(uname)" in
  Darwin)
    info "Setting up macOS..."

    if ! command -v brew &>/dev/null; then
      info "Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    info "Installing packages..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"

    info "Linking dotfiles..."
    env RCRC="$DOTFILES_DIR/rcrc" rcup -d "$DOTFILES_DIR" -t darwin
    ;;

  Linux)
    info "Setting up Linux..."

    info "Installing apt packages..."
    sudo apt update
    sudo apt install -y \
      autoconf \
      curl \
      fd-find \
      fish \
      fzf \
      git \
      libyaml-dev \
      libssl-dev \
      libreadline-dev \
      ripgrep

    if ! command -v mise &>/dev/null; then
      info "Installing mise..."
      curl https://mise.jdx.dev/install.sh | sh
    fi

    if ! command -v bob &>/dev/null; then
      info "Installing bob (neovim version manager)..."
      ARCH="$(uname -m)"
      case "$ARCH" in
        x86_64)       BOB_ARCH="x86_64" ;;
        aarch64|arm64) BOB_ARCH="arm" ;;
        *)            echo "Unsupported architecture: $ARCH"; exit 1 ;;
      esac
      ASSET_PATTERN="bob-linux-${BOB_ARCH}.zip"
      DOWNLOAD_URL=$(curl -s https://api.github.com/repos/MordechaiHadad/bob/releases/latest \
        | grep "browser_download_url" | grep "$ASSET_PATTERN" | head -n 1 | cut -d'"' -f4)
      if [ -z "$DOWNLOAD_URL" ]; then
        echo "Error: Could not find release asset for $ASSET_PATTERN"
        exit 1
      fi
      TEMP_EXTRACT="/tmp/bob_extract_$$"
      curl -fsSL "$DOWNLOAD_URL" -o /tmp/bob.zip
      mkdir -p "$TEMP_EXTRACT"
      unzip -q /tmp/bob.zip -d "$TEMP_EXTRACT"
      BOB_BIN=$(find "$TEMP_EXTRACT" -type f -name "bob" | head -n 1)
      if [ -z "$BOB_BIN" ]; then
        echo "Error: Could not find 'bob' executable in zip."
        rm -rf "$TEMP_EXTRACT" /tmp/bob.zip
        exit 1
      fi
      mkdir -p "$HOME/.local/bin"
      mv "$BOB_BIN" "$HOME/.local/bin/bob"
      chmod +x "$HOME/.local/bin/bob"
      rm -rf "$TEMP_EXTRACT" /tmp/bob.zip
    fi

    info "Linking dotfiles..."
    sh "$DOTFILES_DIR/install-linux.sh"

    if [ ! -f "$HOME/.gitconfig.local" ]; then
      info "Creating gitconfig.local (disabling commit signing)..."
      cat > "$HOME/.gitconfig.local" <<'EOF'
[commit]
  gpgsign = false
EOF
    fi
    ;;

  *)
    echo "Unsupported platform: $(uname)"
    exit 1
    ;;
esac

if command -v fish &>/dev/null; then
  if ! fish -c "type -q fisher" 2>/dev/null; then
    info "Installing fisher..."
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
  fi

  info "Installing fish plugins..."
  fish -c "fisher update"

  FISH_PATH="$(command -v fish)"
  if [ "$SHELL" != "$FISH_PATH" ]; then
    if ! grep -qx "$FISH_PATH" /etc/shells; then
      info "Adding fish to /etc/shells..."
      echo "$FISH_PATH" | sudo tee -a /etc/shells
    fi
    info "Changing default shell to fish..."
    sudo chsh -s "$FISH_PATH" "$USER"
  fi
fi

info "Done!"
