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
        aarch64) BOB_ARCH="aarch64-unknown-linux-gnu" ;;
        x86_64)  BOB_ARCH="x86_64-unknown-linux-gnu" ;;
        *)       echo "Unsupported architecture: $ARCH"; exit 1 ;;
      esac
      BOB_VERSION="$(curl -s https://api.github.com/repos/MordechaiHadad/bob/releases/latest | grep tag_name | cut -d'"' -f4)"
      curl -fsSL "https://github.com/MordechaiHadad/bob/releases/download/${BOB_VERSION}/bob-${BOB_ARCH}.zip" -o /tmp/bob.zip
      unzip -o /tmp/bob.zip -d /tmp/bob
      mv /tmp/bob/bob-${BOB_ARCH}/bob "$HOME/.local/bin/bob"
      chmod +x "$HOME/.local/bin/bob"
      rm -rf /tmp/bob /tmp/bob.zip
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
fi

info "Done!"
