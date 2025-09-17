# Vim 配置快速参考

## 🚀 快速开始
```bash
cd vim-config-package
./scripts/install.sh    # 安装所有内容
```

## ⌨️ 基本快捷键

### 代码导航
| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `gd` | 跳转到定义 | 跳转到函数/变量定义处 |
| `gr` | 查找引用 | 显示所有使用位置 |
| `gi` | 跳转到实现 | 跳转到实现处 |
| `gt` | 跳转到类型定义 | 跳转到类型定义 |
| `K` | 显示文档 | 显示函数文档 |
| `Ctrl+o` | 后退 | 导航历史后退 |
| `Ctrl+i` | 前进 | 导航历史前进 |

### 代码补全
| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `Tab` | 下一个建议 | 补全菜单向下导航 |
| `Shift+Tab` | 上一个建议 | 补全菜单向上导航 |
| `Enter` | 接受 | 接受选中的补全 |
| `Ctrl+Space` | 手动触发 | 强制显示补全 |

### 文件操作
| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `Ctrl+n` | 文件树 | 切换 NERDTree 文件浏览器 |
| `Ctrl+p` | 模糊搜索 | 打开 CtrlP 文件查找器 |
| `Ctrl+s` | 保存 | 保存当前文件 |
| `F3` | 格式化代码 | 自动格式化当前文件 |

### 错误导航
| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `[g` | 上一个错误 | 跳转到上一个错误 |
| `]g` | 下一个错误 | 跳转到下一个错误 |
| `,d` | 错误详情 | 显示详细错误信息 |
| `,t` | 切换检查 | 启用/禁用错误检查 |

### 手动控制
| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `,c` | 切换补全 | 启用/禁用自动补全 |
| `,h` | 清除高亮 | 清除搜索高亮 |
| `F4` | 切换空白字符 | 显示/隐藏空白字符 |

## 🔧 配置文件

### 核心文件
- `configs/vimrc` - 主要 vim 配置
- `configs/zshrc` - Shell 配置备份

### 文档
- `docs/README_CN.md` - 中文完整文档
- `docs/QUICK_REFERENCE_CN.md` - 此文件

### 脚本
- `scripts/install.sh` - 安装脚本
- `scripts/backup.sh` - 备份当前配置
- `scripts/uninstall.sh` - 移除配置

### 扩展
- `extras/advanced.vim` - 高级功能
- `extras/themes.vim` - 颜色方案
- `extras/plugins.vim` - 插件建议

## 🎯 功能概览

### 智能补全
- ✅ 只显示相关建议（最多 10 个）
- ✅ 头文件和当前文件内容
- ✅ 200ms 延迟，流畅体验
- ✅ 多语言支持

### 错误检查
- ✅ 实时语法检查
- ✅ 可视错误指示器（X、!）
- ✅ 按需手动错误详情
- ✅ 保存时自动修复

### 导航工具
- ✅ 文件树浏览器
- ✅ 模糊文件搜索
- ✅ Git 集成
- ✅ 智能窗口管理

## 💻 支持的语言

| 语言 | LSP 服务器 | 语法检查器 | 格式化器 |
|------|------------|------------|----------|
| C/C++ | clangd | clangd + cppcheck | clang-format |
| Python | pylsp | pylsp + flake8 | autopep8 + isort |
| Rust | rust-analyzer | analyzer | rustfmt |
| Java | javac | javac | google_java_format |

## 🛠️ 管理命令

### 安装
```bash
./scripts/install.sh          # 完整安装
```

### 备份和恢复
```bash
./scripts/backup.sh           # 备份当前配置
./scripts/uninstall.sh        # 移除并可选恢复
```

### 插件管理
```bash
vim +PlugInstall +qall        # 安装插件
vim +PlugUpdate +qall         # 更新插件
vim +PlugClean +qall          # 移除未使用插件
```

## 🚨 故障排除

### 检查安装
```bash
vim -c ':source ~/.vimrc' -c ':echo "OK"' -c ':q'
```

### 检查 LSP 状态
```vim
:LspStatus                    # 检查 LSP 服务器
:ALEInfo                      # 检查语法检查
:PlugStatus                   # 检查插件
```

### 常见问题
1. **没有补全**：检查 `:echo g:asyncomplete_auto_popup`
2. **没有错误显示**：尝试 `:ALEToggle`
3. **LSP 不工作**：检查 `which clangd`

## 📦 迁移

### 导出配置
```bash
cd ~/vim-config-package
tar -czf vim-config.tar.gz .
```

### 导入到新机器
```bash
scp vim-config.tar.gz user@newmachine:~/
ssh user@newmachine
tar -xzf vim-config.tar.gz
cd vim-config-package
./scripts/install.sh
```

## 🎨 自定义

### 更换主题
添加到你的 .vimrc：
```vim
colorscheme desert           # 内置主题
" 或安装插件主题（参见 extras/themes.vim）
```

### 调整补全
```vim
let g:asyncomplete_popup_delay = 500    # 更慢的弹出
let g:asyncomplete_max_items = 5        # 更少的建议
```

### 添加自定义键
```vim
nnoremap <leader>f :Files<CR>           # 自定义文件搜索
```

## 📋 文件结构
```
vim-config-package/
├── configs/          # 核心配置文件
├── scripts/          # 安装和管理
├── docs/            # 文档
└── extras/          # 可选增强
```

## 🆘 获取帮助

### 在 Vim 中
```vim
:help <主题>                 # 通用 vim 帮助
:help <插件名>               # 插件特定帮助
```

### 检查配置
```vim
:echo g:loaded_plugins       # 查看已加载插件
:verbose map <键>            # 检查键映射
```

---

**快速提示**：按 `F6` 循环切换颜色主题！
**备份提示**：重大更改前运行 `./scripts/backup.sh`！