# Vim Configuration Quick Reference

## 🚀 Quick Start
```bash
cd vim-config-package
./scripts/install.sh    # Install everything
```

## ⌨️ Essential Key Bindings

### Code Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to definition | Jump to function/variable definition |
| `gr` | Find references | Show all usage locations |
| `gi` | Go to implementation | Jump to implementation |
| `gt` | Go to type definition | Jump to type definition |
| `K` | Show documentation | Display function docs |
| `Ctrl+o` | Go back | Navigate backward |
| `Ctrl+i` | Go forward | Navigate forward |

### Code Completion
| Key | Action | Description |
|-----|--------|-------------|
| `Tab` | Next suggestion | Navigate completion menu down |
| `Shift+Tab` | Previous suggestion | Navigate completion menu up |
| `Enter` | Accept | Accept selected completion |
| `Ctrl+Space` | Manual trigger | Force show completion |

### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+n` | File tree | Toggle NERDTree file browser |
| `Ctrl+p` | Fuzzy search | Open CtrlP file finder |
| `Ctrl+s` | Save | Save current file |
| `F3` | Format code | Auto-format current file |

### Error Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `[g` | Previous error | Jump to previous error |
| `]g` | Next error | Jump to next error |
| `,d` | Error details | Show detailed error info |
| `,t` | Toggle checking | Enable/disable error checking |

### Manual Controls
| Key | Action | Description |
|-----|--------|-------------|
| `,c` | Toggle completion | Enable/disable auto-completion |
| `,h` | Clear highlight | Clear search highlighting |
| `F4` | Toggle whitespace | Show/hide whitespace chars |

## 🔧 Configuration Files

### Core Files
- `configs/vimrc` - Main vim configuration
- `configs/zshrc` - Shell configuration backup

### Documentation
- `docs/README.md` - Complete documentation
- `docs/QUICK_REFERENCE.md` - This file

### Scripts
- `scripts/install.sh` - Installation script
- `scripts/backup.sh` - Backup current config
- `scripts/uninstall.sh` - Remove configuration

### Extras
- `extras/advanced.vim` - Additional features
- `extras/themes.vim` - Color schemes
- `extras/plugins.vim` - Plugin suggestions

## 🎯 Features Overview

### Smart Completion
- ✅ Only relevant suggestions (max 10)
- ✅ Headers and current file content
- ✅ 200ms delay for smooth experience
- ✅ Multi-language support

### Error Checking
- ✅ Real-time syntax checking
- ✅ Visual error indicators (X, !)
- ✅ Manual error details on demand
- ✅ Auto-fix on save

### Navigation Tools
- ✅ File tree browser
- ✅ Fuzzy file search
- ✅ Git integration
- ✅ Smart window management

## 💻 Supported Languages

| Language | LSP Server | Linter | Formatter |
|----------|------------|--------|-----------|
| C/C++ | clangd | clangd + cppcheck | clang-format |
| Python | pylsp | pylsp + flake8 | autopep8 + isort |
| Rust | rust-analyzer | analyzer | rustfmt |
| Java | javac | javac | google_java_format |

## 🛠️ Management Commands

### Installation
```bash
./scripts/install.sh          # Full installation
```

### Backup & Restore
```bash
./scripts/backup.sh           # Backup current config
./scripts/uninstall.sh        # Remove and optionally restore
```

### Plugin Management
```bash
vim +PlugInstall +qall        # Install plugins
vim +PlugUpdate +qall         # Update plugins
vim +PlugClean +qall          # Remove unused plugins
```

## 🚨 Troubleshooting

### Check Installation
```bash
vim -c ':source ~/.vimrc' -c ':echo "OK"' -c ':q'
```

### Check LSP Status
```vim
:LspStatus                    " Check LSP servers
:ALEInfo                      " Check syntax checking
:PlugStatus                   " Check plugins
```

### Common Issues
1. **No completion**: Check `:echo g:asyncomplete_auto_popup`
2. **No errors shown**: Try `:ALEToggle`
3. **LSP not working**: Check `which clangd`

## 📦 Migration

### Export Configuration
```bash
cd ~/vim-config-package
tar -czf vim-config.tar.gz .
```

### Import to New Machine
```bash
scp vim-config.tar.gz user@newmachine:~/
ssh user@newmachine
tar -xzf vim-config.tar.gz
cd vim-config-package
./scripts/install.sh
```

## 🎨 Customization

### Change Theme
Add to your .vimrc:
```vim
colorscheme desert           " Built-in theme
" Or install plugin themes (see extras/themes.vim)
```

### Adjust Completion
```vim
let g:asyncomplete_popup_delay = 500    " Slower popup
let g:asyncomplete_max_items = 5        " Fewer suggestions
```

### Add Custom Keys
```vim
nnoremap <leader>f :Files<CR>           " Custom file search
```

## 📋 File Structure
```
vim-config-package/
├── configs/          # Core configuration files
├── scripts/          # Installation and management
├── docs/            # Documentation
└── extras/          # Optional enhancements
```

## 🆘 Getting Help

### In Vim
```vim
:help <topic>                " General vim help
:help <plugin-name>          " Plugin-specific help
```

### Check Configuration
```vim
:echo g:loaded_plugins       " See loaded plugins
:verbose map <key>           " Check key mappings
```

---

**Quick tip**: Press `F6` to cycle through color themes!
**Backup tip**: Run `./scripts/backup.sh` before major changes!