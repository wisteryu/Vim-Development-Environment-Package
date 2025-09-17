# Vim 开发环境配置包

基于 LSP 的现代化 Vim 配置，支持智能补全、语法检查和多语言开发。

## 🚀 快速开始

```bash
./scripts/install.sh
```

## 📦 包含内容

```
vim-config-package/
├── configs/                 # 核心配置文件
│   ├── vimrc               # 主要 vim 配置
│   └── zshrc               # shell 配置备份
├── scripts/                # 管理脚本
│   ├── install.sh          # ✨ 安装脚本
│   ├── backup.sh           # 💾 备份当前配置
│   └── uninstall.sh        # 🗑️ 卸载和恢复
├── docs/                   # 文档
│   ├── README.md           # 📖 英文完整文档
│   ├── README_CN.md        # 📖 中文完整文档
│   ├── QUICK_REFERENCE.md  # ⚡ 快速参考（英文）
│   └── QUICK_REFERENCE_CN.md # ⚡ 快速参考（中文）
└── extras/                 # 可选增强
    ├── advanced.vim        # 🔧 高级功能
    ├── themes.vim          # 🎨 颜色主题
    └── plugins.vim         # 🔌 额外插件
```

## 🎯 主要特性

### 智能代码补全
- **精准建议**：只显示相关头文件和当前文件内容
- **多语言支持**：C/C++、Python、Rust、Java
- **快速响应**：200ms 延迟，智能过滤
- **控制范围**：最多 10 个建议，避免混乱

### 高级代码导航
- **跳转到定义**（`gd`）：跳转到函数/变量定义
- **查找引用**（`gr`）：显示所有使用位置
- **显示文档**（`K`）：显示函数签名
- **文件浏览器**（`Ctrl+n`）：NERDTree 集成
- **模糊搜索**（`Ctrl+p`）：快速文件查找

### 开发工具
- **实时错误检查**：使用 ALE 和 clangd、pylsp
- **自动格式化**：保存时自动格式化代码
- **Git 集成**：Fugitive 版本控制
- **项目导航**：增强的窗口管理

## ⚡ 快速命令

| 操作 | 命令 |
|------|------|
| **安装** | `./scripts/install.sh` |
| **备份** | `./scripts/backup.sh` |
| **卸载** | `./scripts/uninstall.sh` |
| **更新插件** | `vim +PlugUpdate +qall` |

## 🎮 基本快捷键

| 快捷键 | 功能 | 快捷键 | 功能 |
|--------|------|--------|------|
| `gd` | 跳转到定义 | `Ctrl+p` | 文件搜索 |
| `gr` | 查找引用 | `Ctrl+n` | 文件树 |
| `K` | 显示文档 | `F3` | 格式化代码 |
| `[g` / `]g` | 错误导航 | `,d` | 错误详情 |

## 🛠️ 当前配置总结

### 生产力优化
- **减少干扰**：专注的错误显示，没有过多弹窗
- **智能补全**：只显示包含文件的相关建议
- **平衡检查**：实时错误检查但不持续打扰
- **手动控制**：需要时切换功能（`,c`、`,t`、`F4`）

### 语言支持
- **C/C++**：clangd LSP、clang-format、智能头文件补全
- **Python**：pylsp、autopep8、PEP8 检查
- **Rust**：rust-analyzer、cargo 集成
- **Java**：javac 语法检查、Google Java 格式

### 视觉增强
- **清晰界面**：Airline 状态栏显示 git 和错误信息
- **智能高亮**：语法感知颜色，不混乱
- **错误指示**：清晰的 X/! 符号表示问题
- **空白字符控制**：F4 切换显示

## 📋 迁移指南

### 导出配置
```bash
cd ~/vim-config-package
tar -czf my-vim-config.tar.gz .
```

### 导入到新机器
```bash
# 复制配置包
scp my-vim-config.tar.gz user@newmachine:~/

# 在新机器上安装
ssh user@newmachine
tar -xzf my-vim-config.tar.gz
cd vim-config-package
./scripts/install.sh
```

## 🎨 自定义选项

### 颜色主题
查看 `extras/themes.vim` 获取 20+ 颜色方案选项：
- 内置主题（desert、darkblue 等）
- 插件主题（gruvbox、onedark、dracula）
- F6 自定义主题切换

### 高级功能
查看 `extras/advanced.vim` 获取附加功能：
- 会话管理
- 增强搜索/替换
- 多光标支持
- 调试工具
- 性能优化

### 插件扩展
查看 `extras/plugins.vim` 获取 50+ 插件建议：
- 代码编辑增强
- Git 工作流工具
- 语言特定支持
- 开发实用工具

## 🚨 故障排除

### 安装问题
```bash
# 检查依赖
which node clangd git

# 测试配置
vim -c ':source ~/.vimrc' -c ':echo "OK"' -c ':q'
```

### 功能问题
```vim
# 检查 LSP 状态
:LspStatus

# 检查语法检查
:ALEInfo

# 检查插件
:PlugStatus
```

## 🆘 支持

- **完整文档**：`docs/README.md` 英文完整指南
- **中文文档**：`docs/README_CN.md` 中文完整指南
- **快速参考**：`docs/QUICK_REFERENCE_CN.md` 中文快捷键参考
- **Vim 帮助**：`:help <主题>` 内置文档
- **插件帮助**：`:help <插件名>` 插件特定信息

## 📄 许可证

MIT 许可证 - 可自由修改和分享！

---

**实用技巧：**
- 重大更改前运行 `./scripts/backup.sh`
- 使用 `F6` 循环切换颜色主题
- 按 `,c` 切换自动补全
- 在任何函数上按 `gd` 跳转到定义

**编程愉快！** 🎉