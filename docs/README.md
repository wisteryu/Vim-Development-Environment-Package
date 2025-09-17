# Vim Development Environment

Modern Vim configuration with LSP support for C/C++, Python, Rust, and Java development.

## 🚀 Features

### Smart Code Completion
- **Intelligent suggestions**: Only shows relevant content from included headers and current file
- **Multi-language support**: C/C++, Python, Rust, Java
- **Fast response**: 200ms delay with smart filtering
- **Limited scope**: Max 10 suggestions to avoid clutter

### Advanced Code Navigation
- **Go to definition** (`gd`): Jump to function/variable definitions
- **Find references** (`gr`): Show all usage locations
- **View documentation** (`K`): Display function signatures and docs
- **Symbol navigation**: `[g` / `]g` for error navigation

### Development Tools
- **File browser**: NERDTree with `Ctrl+n`
- **Fuzzy search**: CtrlP with `Ctrl+p`
- **Git integration**: Fugitive for version control
- **Auto formatting**: F3 or save-time formatting
- **Syntax checking**: Real-time error detection

### Smart Interface
- **Minimal distractions**: Focused error display
- **Custom indicators**: Clear error/warning symbols (X, !)
- **Status bar**: Airline with git and error status
- **Configurable**: Easy toggle for features

## 📦 Installation

### Quick Install
```bash
cd vim-config-package
./scripts/install.sh
```

### Manual Install
1. **Install dependencies**:
   ```bash
   # macOS
   brew install node llvm git ripgrep fd

   # Ubuntu/Debian
   sudo apt install nodejs npm clangd git ripgrep fd-find
   ```

2. **Install vim-plug**:
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. **Copy configuration**:
   ```bash
   cp configs/vimrc ~/.vimrc
   ```

4. **Install plugins**:
   ```bash
   vim +PlugInstall +qall
   ```

## 🎯 Current Configuration Summary

### Core Plugins
```vim
" LSP and Completion
vim-lsp                 " Language Server Protocol client
vim-lsp-settings        " Auto-configure LSP servers
asyncomplete.vim        " Async completion framework
asyncomplete-lsp.vim    " LSP completion source
asyncomplete-buffer.vim " Buffer content completion

" Development Tools
ale                     " Asynchronous linting engine
nerdtree               " File tree explorer
ctrlp.vim              " Fuzzy file finder
vim-fugitive           " Git integration
vim-autoformat         " Code formatting

" Interface
vim-airline            " Status/tabline
auto-pairs             " Bracket auto-pairing
nerdcommenter          " Easy commenting
```

### Language Support

#### C/C++
- **LSP Server**: clangd
- **Linters**: clangd + cppcheck
- **Formatter**: clang-format
- **Features**: Header completion, function signatures, error checking

#### Python
- **LSP Server**: pylsp
- **Linters**: pylsp + flake8
- **Formatter**: autopep8 + isort
- **Features**: Library completion, PEP8 checking

#### Rust
- **LSP Server**: rust-analyzer
- **Formatter**: rustfmt
- **Features**: Cargo integration, trait completion

#### Java
- **Linter**: javac
- **Formatter**: google_java_format
- **Features**: Class completion, error checking

## ⌨️ Key Bindings

### Code Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Show documentation |
| `Ctrl+o` | Go back |
| `Ctrl+i` | Go forward |

### Code Completion
| Key | Action |
|-----|--------|
| `Tab` | Next suggestion |
| `Shift+Tab` | Previous suggestion |
| `Enter` | Accept suggestion |
| `Ctrl+Space` | Manual trigger |

### File Operations
| Key | Action |
|-----|--------|
| `Ctrl+n` | Toggle file tree |
| `Ctrl+p` | Fuzzy file search |
| `Ctrl+s` | Save file |
| `F3` | Format code |

### Error Navigation
| Key | Action |
|-----|--------|
| `[g` | Previous error |
| `]g` | Next error |
| `,d` | Show error details |
| `,t` | Toggle error checking |

### Manual Controls
| Key | Action |
|-----|--------|
| `,c` | Toggle auto-completion |
| `,h` | Clear search highlight |
| `F4` | Toggle whitespace display |

## 🔧 Configuration Details

### Completion Settings
```vim
" Smart completion
let g:asyncomplete_auto_popup = 1          " Auto show menu
let g:asyncomplete_popup_delay = 200       " 200ms delay
let g:asyncomplete_min_chars = 2           " Min 2 chars
let g:asyncomplete_max_items = 10          " Max 10 items
let g:asyncomplete_smart_completion = 1    " Smart filtering
```

### LSP Configuration
```vim
" Focused suggestions
let g:lsp_diagnostics_enabled = 1          " Enable diagnostics
let g:lsp_signs_enabled = 1                " Show error signs
let g:lsp_diagnostics_echo_cursor = 0      " No auto error display
let g:lsp_completion_auto_import = 0       " No auto imports
let g:lsp_completion_filter_text = 1       " Filter suggestions
```

### Error Checking
```vim
" Balanced error checking
let g:ale_lint_on_text_changed = 'normal'  " Check in normal mode
let g:ale_lint_delay = 300                 " 300ms delay
let g:ale_echo_cursor = 0                  " No cursor echo
let g:ale_sign_error = 'X'                 " Error symbol
let g:ale_sign_warning = '!'               " Warning symbol
```

## 🎨 Interface Customization

### Visual Settings
- **Line numbers**: Enabled with cursor line highlight
- **Whitespace**: Only show tabs and trailing spaces
- **Folding**: Syntax-based with auto-unfold
- **Mouse**: Enabled for easy navigation
- **Search**: Smart case with incremental search

### Status Bar
- **Git branch**: Current branch display
- **Error count**: Active errors/warnings
- **File info**: Type, encoding, position
- **Tab line**: Multiple file support

## 🔍 Troubleshooting

### Common Issues

1. **LSP not working**:
   ```bash
   # Check if clangd is installed
   which clangd

   # Check LSP status in vim
   :LspStatus
   ```

2. **Completion not showing**:
   ```bash
   # Check plugins installed
   :PlugStatus

   # Check completion settings
   :echo g:asyncomplete_auto_popup
   ```

3. **Errors not showing**:
   ```bash
   # Check ALE status
   :ALEInfo

   # Toggle ALE
   :ALEToggle
   ```

### Performance Issues
- **Large files**: Auto-disabled for files > 5MB
- **Slow completion**: Increase delay with `:let g:asyncomplete_popup_delay = 500`
- **Too many errors**: Use `:ALEToggle` to temporarily disable

## 📁 File Structure

```
vim-config-package/
├── configs/
│   ├── vimrc              # Main vim configuration
│   └── zshrc              # Shell configuration
├── scripts/
│   ├── install.sh         # Installation script
│   ├── backup.sh          # Backup script
│   └── uninstall.sh       # Uninstall script
├── docs/
│   ├── README.md          # This file
│   ├── KEYBINDINGS.md     # Detailed key bindings
│   └── TROUBLESHOOTING.md # Common issues
└── extras/
    ├── advanced.vim       # Additional configurations
    ├── themes.vim         # Color themes
    └── plugins.vim        # Extra plugins
```

## 🔄 Migration Guide

### Export Current Setup
```bash
./scripts/backup.sh
```

### Import to New Machine
```bash
# Copy the entire package
scp -r vim-config-package user@newmachine:~/

# Run installation
cd vim-config-package
./scripts/install.sh
```

### Selective Import
```bash
# Only copy specific configs
cp configs/vimrc ~/.vimrc
cp extras/advanced.vim ~/.vim/
```

## 📝 Customization

### Adding New Languages
1. Add LSP server to `g:ale_linters`
2. Add formatter to `g:ale_fixers`
3. Add file type settings in autocmd section

### Changing Key Bindings
1. Edit the key mapping sections in vimrc
2. Use `:map` to check current mappings
3. Use `:unmap` to remove unwanted mappings

### Adjusting Completion
1. Modify `g:asyncomplete_*` settings
2. Change `g:lsp_*` options
3. Add custom completion sources

## 🆘 Support

### Getting Help
- **Vim help**: `:help <topic>`
- **Plugin docs**: `:help <plugin-name>`
- **LSP info**: `:LspStatus`, `:LspLog`
- **ALE info**: `:ALEInfo`

### Configuration Check
```bash
# Test configuration
vim -c ':source ~/.vimrc' -c ':echo "Config OK"' -c ':q'

# Check plugin status
vim -c ':PlugStatus' -c ':q'
```

---

**Version**: 1.0
**Last Updated**: 2024
**Compatibility**: Vim 8.0+, macOS, Linux
**License**: MIT