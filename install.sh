#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE=""

usage() {
    echo "Usage: $0 --desktop | --robot"
    echo ""
    echo "  --desktop   Full setup: i3, alacritty, zsh, tmux, vim + dotfiles"
    echo "  --robot     Headless setup: zsh, tmux, vim + dotfiles (no GUI)"
    exit 1
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --desktop) MODE="desktop" ;;
        --robot)   MODE="robot" ;;
        *) usage ;;
    esac
    shift
done

[[ -z "$MODE" ]] && usage

echo "==> Updating packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "==> Installing common packages..."
sudo apt-get install -y \
    git \
    vim \
    zsh \
    curl \
    ranger \
    tmux \
    tmuxinator \
    fonts-powerline \
    fonts-hack-ttf

if [[ "$MODE" == "desktop" ]]; then
    echo "==> Installing desktop packages..."
    sudo apt-get install -y \
        polybar \
        rofi \
        maim \
        xdotool \
        xclip

    echo "==> Installing i3-gaps..."
    sudo add-apt-repository -y ppa:regolith-linux/stable
    sudo apt-get update -y
    sudo apt-get install -y i3-gaps

    echo "==> Installing alacritty via snap..."
    sudo snap install alacritty --classic
fi

echo "==> Installing oh-my-zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "    oh-my-zsh already installed, skipping."
fi

echo "==> Installing tmux plugin manager..."
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "==> Installing zsh plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

echo "==> Setting zsh as default shell..."
if [[ "$SHELL" != "$(which zsh)" ]]; then
    chsh -s "$(which zsh)"
fi

link() {
    local src="$1"
    local dst="$2"
    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "    $dst -> $src"
}

echo "==> Creating symlinks..."
link "$SCRIPT_DIR/.zshrc"     "$HOME/.zshrc"
link "$SCRIPT_DIR/.vimrc"     "$HOME/.vimrc"
link "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

if [[ "$MODE" == "desktop" ]]; then
    link "$SCRIPT_DIR/.Xresources"        "$HOME/.Xresources"
    link "$SCRIPT_DIR/config"             "$HOME/.config/i3/config"
    link "$SCRIPT_DIR/alacritty.toml"     "$HOME/.config/alacritty/alacritty.toml"
    link "$SCRIPT_DIR/polybar/config.ini" "$HOME/.config/polybar/config.ini"
    link "$SCRIPT_DIR/polybar/launch.sh"  "$HOME/.config/polybar/launch.sh"
    link "$SCRIPT_DIR/rofi/config.rasi"   "$HOME/.config/rofi/config.rasi"
fi

echo ""
echo "Done! Run 'exec zsh' or log out and back in to start using zsh."
