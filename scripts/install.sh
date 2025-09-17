#!/bin/bash

# Vim Development Environment Installation Script
# Author: Claude Code Assistant
# Description: Installs modern vim configuration with LSP support

set -e

echo "=== Vim Development Environment Installer ==="
echo ""

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS or Linux
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        log_info "Detected macOS"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
        log_info "Detected Linux"
    else
        log_error "Unsupported operating system: $OSTYPE"
        exit 1
    fi
}

# Backup existing configurations
backup_configs() {
    log_info "Backing up existing configurations..."

    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup_dir="$HOME/.vim_backup_$timestamp"
    mkdir -p "$backup_dir"

    # Backup existing files
    for file in ".vimrc" ".vim" ".zshrc"; do
        if [[ -e "$HOME/$file" ]]; then
            cp -r "$HOME/$file" "$backup_dir/"
            log_success "Backed up $file"
        fi
    done

    log_success "Backup completed in: $backup_dir"
}

# Install dependencies
install_dependencies() {
    log_info "Installing dependencies..."

    if [[ "$OS" == "macos" ]]; then
        # Check if Homebrew is installed
        if ! command -v brew &> /dev/null; then
            log_error "Homebrew is required. Please install it first:"
            echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
            exit 1
        fi

        # Install required packages
        log_info "Installing packages via Homebrew..."
        brew install node llvm git ripgrep fd

        # Add LLVM to PATH
        if ! echo "$PATH" | grep -q "/opt/homebrew/Cellar/llvm"; then
            echo 'export PATH="/opt/homebrew/Cellar/llvm/*/bin:$PATH"' >> ~/.zshrc
            log_success "Added LLVM to PATH"
        fi

    elif [[ "$OS" == "linux" ]]; then
        # Detect package manager
        if command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y nodejs npm clangd git ripgrep fd-find
        elif command -v yum &> /dev/null; then
            sudo yum install -y nodejs npm clang-tools-extra git ripgrep fd-find
        elif command -v pacman &> /dev/null; then
            sudo pacman -S nodejs npm clang git ripgrep fd
        else
            log_error "No supported package manager found"
            exit 1
        fi
    fi

    log_success "Dependencies installed"
}

# Install vim-plug
install_vim_plug() {
    log_info "Installing vim-plug..."

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    log_success "vim-plug installed"
}

# Install configurations
install_configs() {
    log_info "Installing vim configuration..."

    # Copy configuration files
    cp "$(dirname "$0")/../configs/vimrc" ~/.vimrc

    log_success "Configuration files installed"
}

# Install vim plugins
install_plugins() {
    log_info "Installing vim plugins..."

    vim +PlugInstall +qall

    log_success "Vim plugins installed"
}

# Verify installation
verify_installation() {
    log_info "Verifying installation..."

    # Check if vim can load the configuration
    if vim -c ':source ~/.vimrc' -c ':q' &>/dev/null; then
        log_success "Vim configuration loads successfully"
    else
        log_error "Vim configuration failed to load"
        exit 1
    fi

    # Check if required commands exist
    for cmd in node clangd git; do
        if command -v "$cmd" &> /dev/null; then
            log_success "$cmd is available"
        else
            log_warning "$cmd is not available"
        fi
    done
}

# Main installation process
main() {
    echo ""
    log_info "Starting installation process..."
    echo ""

    detect_os
    backup_configs
    install_dependencies
    install_vim_plug
    install_configs
    install_plugins
    verify_installation

    echo ""
    log_success "=== Installation completed successfully! ==="
    echo ""
    echo "Quick start:"
    echo "  1. Open a new terminal session"
    echo "  2. Run: vim test.cpp"
    echo "  3. Start coding with intelligent suggestions!"
    echo ""
    echo "Key features:"
    echo "  • Smart code completion (Tab/Shift+Tab)"
    echo "  • Go to definition (gd)"
    echo "  • Find references (gr)"
    echo "  • Show documentation (K)"
    echo "  • File browser (Ctrl+n)"
    echo "  • Fuzzy file search (Ctrl+p)"
    echo ""
    echo "Need help? Check: ~/vim-config-package/docs/README.md"
}

# Run installation
main "$@"