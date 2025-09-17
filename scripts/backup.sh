#!/bin/bash

# Vim Configuration Backup Script
# Creates a backup of current vim and shell configurations

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

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$(dirname "$SCRIPT_DIR")"

# Create backup directory with timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$HOME/.vim_backup_$TIMESTAMP"

echo "=== Vim Configuration Backup Tool ==="
echo ""

# Create backup directory
log_info "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Function to backup file or directory
backup_item() {
    local item="$1"
    local description="$2"

    if [[ -e "$HOME/$item" ]]; then
        log_info "Backing up $description..."
        cp -r "$HOME/$item" "$BACKUP_DIR/"
        log_success "✓ $description backed up"
        return 0
    else
        log_warning "⚠ $description not found, skipping"
        return 1
    fi
}

# Backup configurations
log_info "Starting backup process..."
echo ""

backup_count=0

# Core vim files
if backup_item ".vimrc" "Vim configuration"; then ((backup_count++)); fi
if backup_item ".vim" "Vim directory"; then ((backup_count++)); fi

# Shell configurations
if backup_item ".zshrc" "Zsh configuration"; then ((backup_count++)); fi
if backup_item ".bashrc" "Bash configuration"; then ((backup_count++)); fi
if backup_item ".bash_profile" "Bash profile"; then ((backup_count++)); fi

# Git configuration
if backup_item ".gitconfig" "Git configuration"; then ((backup_count++)); fi

# Tmux configuration
if backup_item ".tmux.conf" "Tmux configuration"; then ((backup_count++)); fi

# SSH configuration
if backup_item ".ssh/config" "SSH configuration"; then ((backup_count++)); fi

# Additional vim-related files
if backup_item ".viminfo" "Vim history"; then ((backup_count++)); fi

# Create backup metadata
log_info "Creating backup metadata..."
cat > "$BACKUP_DIR/backup_info.txt" << EOF
Vim Configuration Backup
========================

Backup Date: $(date)
Backup Directory: $BACKUP_DIR
Host: $(hostname)
User: $(whoami)
OS: $(uname -s)
Vim Version: $(vim --version | head -1 2>/dev/null || echo "Vim not found")

Files Backed Up: $backup_count

Contents:
$(ls -la "$BACKUP_DIR" 2>/dev/null || echo "Error listing contents")

To restore this backup:
1. Navigate to the backup directory: cd "$BACKUP_DIR"
2. Copy files back to home: cp -r .vimrc .vim ~/.
3. Or use the restore script: ./restore.sh "$BACKUP_DIR"
EOF

# Create a simple restore script
log_info "Creating restore script..."
cat > "$BACKUP_DIR/restore.sh" << 'EOF'
#!/bin/bash

# Quick restore script
# Usage: ./restore.sh

set -e

BACKUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Restoring Vim Configuration ==="
echo "From: $BACKUP_DIR"
echo ""

read -p "This will overwrite your current configuration. Continue? (y/N): " confirm
if [[ $confirm != [yY] ]]; then
    echo "Restore cancelled."
    exit 0
fi

# Restore files
for item in .vimrc .vim .zshrc .bashrc .bash_profile .gitconfig .tmux.conf .viminfo; do
    if [[ -e "$BACKUP_DIR/$item" ]]; then
        echo "Restoring $item..."
        cp -r "$BACKUP_DIR/$item" "$HOME/"
        echo "✓ $item restored"
    fi
done

# Handle SSH config specially
if [[ -e "$BACKUP_DIR/config" ]]; then
    echo "Restoring SSH config..."
    mkdir -p "$HOME/.ssh"
    cp "$BACKUP_DIR/config" "$HOME/.ssh/"
    chmod 600 "$HOME/.ssh/config"
    echo "✓ SSH config restored"
fi

echo ""
echo "✅ Restore completed!"
echo "Please restart your terminal or run: source ~/.zshrc"
EOF

chmod +x "$BACKUP_DIR/restore.sh"

# Create archive option
if command -v tar &> /dev/null; then
    log_info "Creating compressed archive..."
    cd "$(dirname "$BACKUP_DIR")"
    tar -czf "${BACKUP_DIR}.tar.gz" "$(basename "$BACKUP_DIR")"
    log_success "Archive created: ${BACKUP_DIR}.tar.gz"
fi

# Summary
echo ""
log_success "=== Backup Completed Successfully! ==="
echo ""
echo "📁 Backup Location: $BACKUP_DIR"
echo "📦 Files Backed Up: $backup_count"
if [[ -f "${BACKUP_DIR}.tar.gz" ]]; then
    echo "🗜️  Archive: ${BACKUP_DIR}.tar.gz"
fi
echo ""
echo "📋 Backup Contents:"
ls -la "$BACKUP_DIR"
echo ""
echo "🔄 To restore: $BACKUP_DIR/restore.sh"
echo "📄 Info file: $BACKUP_DIR/backup_info.txt"
echo ""

# Cleanup old backups (optional)
read -p "🧹 Clean up backups older than 30 days? (y/N): " cleanup
if [[ $cleanup == [yY] ]]; then
    log_info "Cleaning up old backups..."
    find "$HOME" -maxdepth 1 -name ".vim_backup_*" -type d -mtime +30 -exec rm -rf {} + 2>/dev/null || true
    find "$HOME" -maxdepth 1 -name ".vim_backup_*.tar.gz" -mtime +30 -delete 2>/dev/null || true
    log_success "Old backups cleaned up"
fi

echo "✨ Backup process complete!"