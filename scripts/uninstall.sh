#!/bin/bash

# Vim Configuration Uninstaller
# Removes vim configuration and restores backups

set -e

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

echo "=== Vim Configuration Uninstaller ==="
echo ""

# Warning message
log_warning "This will remove your current vim configuration!"
echo ""
echo "This script will:"
echo "  • Remove ~/.vimrc"
echo "  • Remove ~/.vim directory"
echo "  • Remove vim plugins"
echo "  • Optionally restore from backup"
echo ""

read -p "Continue with uninstallation? (y/N): " confirm
if [[ $confirm != [yY] ]]; then
    echo "Uninstallation cancelled."
    exit 0
fi

# Create backup before uninstalling
log_info "Creating backup before uninstall..."
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$HOME/.vim_uninstall_backup_$TIMESTAMP"
mkdir -p "$BACKUP_DIR"

# Backup existing files
for item in ".vimrc" ".vim"; do
    if [[ -e "$HOME/$item" ]]; then
        cp -r "$HOME/$item" "$BACKUP_DIR/"
        log_success "Backed up $item"
    fi
done

# Remove vim configuration
log_info "Removing vim configuration..."

if [[ -f "$HOME/.vimrc" ]]; then
    rm "$HOME/.vimrc"
    log_success "Removed .vimrc"
fi

if [[ -d "$HOME/.vim" ]]; then
    rm -rf "$HOME/.vim"
    log_success "Removed .vim directory"
fi

# Clean up vim-related files
log_info "Cleaning up vim-related files..."

vim_files=(
    ".viminfo"
    ".vim_mru_files"
    ".netrwhist"
)

for file in "${vim_files[@]}"; do
    if [[ -f "$HOME/$file" ]]; then
        rm "$HOME/$file"
        log_success "Removed $file"
    fi
done

# Check for available backups
log_info "Checking for available backups..."
BACKUP_DIRS=($(find "$HOME" -maxdepth 1 -name ".vim_backup_*" -type d 2>/dev/null | sort -r))

if [[ ${#BACKUP_DIRS[@]} -gt 0 ]]; then
    echo ""
    log_info "Found ${#BACKUP_DIRS[@]} backup(s):"
    for i in "${!BACKUP_DIRS[@]}"; do
        backup_date=$(basename "${BACKUP_DIRS[$i]}" | sed 's/.vim_backup_//')
        echo "  $((i+1)). $backup_date (${BACKUP_DIRS[$i]})"
    done
    echo "  0. Keep current state (no restoration)"
    echo ""

    read -p "Select backup to restore (0-${#BACKUP_DIRS[@]}): " choice

    if [[ $choice =~ ^[1-9][0-9]*$ ]] && [[ $choice -le ${#BACKUP_DIRS[@]} ]]; then
        selected_backup="${BACKUP_DIRS[$((choice-1))]}"
        log_info "Restoring from: $selected_backup"

        # Restore from selected backup
        for item in ".vimrc" ".vim" ".zshrc"; do
            if [[ -e "$selected_backup/$item" ]]; then
                cp -r "$selected_backup/$item" "$HOME/"
                log_success "Restored $item"
            fi
        done

        log_success "Configuration restored from backup"
    else
        log_info "No restoration selected, keeping clean state"
    fi
else
    log_warning "No backups found"
fi

# Clean up package manager remnants
log_info "Cleaning up package manager remnants..."

# Clean vim-plug
if command -v vim &> /dev/null; then
    vim -c 'PlugClean!' -c 'qa!' 2>/dev/null || true
fi

# Summary
echo ""
log_success "=== Uninstallation Complete! ==="
echo ""
echo "📁 Uninstall backup: $BACKUP_DIR"
echo "🗑️  Removed: .vimrc, .vim directory, vim plugins"

if [[ ${#BACKUP_DIRS[@]} -gt 0 ]] && [[ $choice =~ ^[1-9][0-9]*$ ]]; then
    echo "🔄 Restored configuration from backup"
else
    echo "🧹 Clean vim state (no configuration)"
fi

echo ""
echo "To reinstall:"
echo "  cd vim-config-package"
echo "  ./scripts/install.sh"
echo ""

# Offer to clean up all backups
echo "🧹 Cleanup Options:"
read -p "Remove all vim backups? (y/N): " cleanup_all
if [[ $cleanup_all == [yY] ]]; then
    find "$HOME" -maxdepth 1 -name ".vim_backup_*" -type d -exec rm -rf {} + 2>/dev/null || true
    find "$HOME" -maxdepth 1 -name ".vim_backup_*.tar.gz" -delete 2>/dev/null || true
    log_success "All vim backups removed"
fi

echo "✨ Uninstallation process complete!"