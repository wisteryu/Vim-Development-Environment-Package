# Vim Development Environment Package

A complete, modern vim configuration package with LSP support, smart completion, and development tools.

## 🚀 Quick Start

```bash
./scripts/install.sh
```

## 📦 Package Contents

```
vim-config-package/
├── configs/                 # Core configuration files
│   ├── vimrc               # Main vim configuration
│   └── zshrc               # Shell configuration backup
├── scripts/                # Management scripts
│   ├── install.sh          # ✨ Installation script
│   ├── backup.sh           # 💾 Backup current config
│   └── uninstall.sh        # 🗑️ Uninstall and restore
├── docs/                   # Documentation
│   ├── README.md           # 📖 Complete documentation
│   └── QUICK_REFERENCE.md  # ⚡ Key bindings & commands
└── extras/                 # Optional enhancements
    ├── advanced.vim        # 🔧 Advanced features
    ├── themes.vim          # 🎨 Color schemes
    └── plugins.vim         # 🔌 Additional plugins
```

## 🎯 Key Features

### Smart Code Completion
- **Focused suggestions**: Only shows relevant content from headers and current file
- **Multi-language**: C/C++, Python, Rust, Java support
- **Fast & smart**: 200ms delay with intelligent filtering
- **Controlled scope**: Maximum 10 suggestions to avoid clutter

### Advanced Navigation
- **Go to definition** (`gd`): Jump to function/variable definitions
- **Find references** (`gr`): Show all usage locations
- **Documentation** (`K`): Display function signatures
- **File browser** (`Ctrl+n`): NERDTree integration
- **Fuzzy search** (`Ctrl+p`): Quick file finding

### Development Tools
- **Real-time error checking**: ALE with clangd, pylsp
- **Auto formatting**: Save-time code formatting
- **Git integration**: Fugitive for version control
- **Project navigation**: Enhanced window management

## ⚡ Quick Commands

| Action | Command |
|--------|---------|
| **Install** | `./scripts/install.sh` |
| **Backup** | `./scripts/backup.sh` |
| **Uninstall** | `./scripts/uninstall.sh` |
| **Update plugins** | `vim +PlugUpdate +qall` |

## 🎮 Essential Keys

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `gd` | Go to definition | `Ctrl+p` | File search |
| `gr` | Find references | `Ctrl+n` | File tree |
| `K` | Show docs | `F3` | Format code |
| `[g` / `]g` | Navigate errors | `,d` | Error details |

## 🛠️ Current Configuration Summary

### Optimized for Productivity
- **Minimal distractions**: Focused error display without overwhelming popups
- **Smart completion**: Only relevant suggestions from included files
- **Balanced checking**: Real-time errors without constant interruptions
- **Manual controls**: Toggle features when needed (`,c`, `,t`, `F4`)

### Language Support
- **C/C++**: clangd LSP, clang-format, intelligent header completion
- **Python**: pylsp, autopep8, PEP8 checking
- **Rust**: rust-analyzer, cargo integration
- **Java**: javac linting, Google Java format

### Visual Enhancements
- **Clean interface**: Airline status bar with git and error info
- **Smart highlighting**: Syntax-aware colors without clutter
- **Error indicators**: Clear X/! symbols for issues
- **Whitespace control**: Toggle display with F4

## 📋 Migration Guide

### Export Configuration
```bash
cd ~/vim-config-package
tar -czf my-vim-config.tar.gz .
```

### Import to New Machine
```bash
# Copy package
scp my-vim-config.tar.gz user@newmachine:~/

# Install on new machine
ssh user@newmachine
tar -xzf my-vim-config.tar.gz
cd vim-config-package
./scripts/install.sh
```

## 🎨 Customization Options

### Color Themes
See `extras/themes.vim` for 20+ color scheme options:
- Built-in themes (desert, darkblue, etc.)
- Plugin themes (gruvbox, onedark, dracula)
- Custom theme switching with F6

### Advanced Features
See `extras/advanced.vim` for additional features:
- Session management
- Enhanced search/replace
- Multiple cursors support
- Debugging tools
- Performance optimizations

### Plugin Extensions
See `extras/plugins.vim` for 50+ plugin suggestions:
- Code editing enhancements
- Git workflow tools
- Language-specific support
- Development utilities

## 🚨 Troubleshooting

### Installation Issues
```bash
# Check dependencies
which node clangd git

# Test configuration
vim -c ':source ~/.vimrc' -c ':echo "OK"' -c ':q'
```

### Feature Issues
```vim
# Check LSP status
:LspStatus

# Check syntax checking
:ALEInfo

# Check plugins
:PlugStatus
```

## 🆘 Support

- **Documentation**: `docs/README.md` for complete guide
- **Quick reference**: `docs/QUICK_REFERENCE.md` for key bindings
- **Vim help**: `:help <topic>` for built-in documentation
- **Plugin help**: `:help <plugin-name>` for plugin-specific info

## 📄 License

MIT License - Feel free to modify and share!

---

**Pro Tips:**
- Run `./scripts/backup.sh` before major changes
- Use `F6` to cycle through color themes
- Press `,c` to toggle auto-completion
- Try `gd` on any function to jump to its definition

**Happy coding!** 🎉