" Vim 高级配置
" 主配置中未包含的附加功能
" 使用方法：将需要的部分添加到你的主 .vimrc 中

" ========================================
" 增强视觉功能
" ========================================

" 更好的颜色方案选项
if has('termguicolors')
    set termguicolors
endif

" 流行的颜色方案（取消注释一个使用）
" colorscheme desert       " 温暖的沙漠色调
" colorscheme darkblue     " 蓝色焦点的深色主题
" colorscheme elflord      " 奇幻风格的深色主题
" colorscheme koehler      " 专业深色主题
" colorscheme murphy       " 高对比度深色主题

" 增强光标
set cursorcolumn
highlight CursorLine cterm=NONE ctermbg=darkgray
highlight CursorColumn cterm=NONE ctermbg=darkgray

" 用颜色显示匹配的括号
highlight MatchParen cterm=bold ctermbg=none ctermfg=magenta

" ========================================
" 高级编辑功能
" ========================================

" 多光标（需要插件）
" Plug 'mg979/vim-visual-multi'

" 围绕文本对象（需要插件）
" Plug 'tpope/vim-surround'
" 用法：cs"' (将 " 改为 ')，ds" (删除 ")，ysiw" (用 " 围绕单词)

" 增强文本对象（需要插件）
" Plug 'wellle/targets.vim'
" 添加支持 cin) (在下一个括号中更改)，da, (删除逗号周围)

" 代码片段支持（需要插件）
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" ========================================
" 生产力增强
" ========================================

" 会话管理
set sessionoptions=buffers,curdir,folds,help,options,tabpages,winsize
" 保存会话：:mksession ~/.vim/sessions/project.vim
" 加载会话：:source ~/.vim/sessions/project.vim

" 撤销持久化
if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" 不同文件类型的智能缩进
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2

" 外部更改时自动重新加载文件
set autoread
autocmd FocusGained,BufEnter * :checktime

" ========================================
" 增强搜索和替换
" ========================================

" 如果可用，使用 ripgrep 进行 grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

" 在项目中搜索光标下的单词
nnoremap <leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" 替换光标下的单词
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

" 默认不区分大小写搜索，如果有大写字母则区分大小写
set ignorecase
set smartcase

" 输入时高亮搜索结果
set incsearch
set hlsearch

" 清除搜索高亮
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" ========================================
" 高级窗口管理
" ========================================

" 更好的窗口导航
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 调整窗口大小
nnoremap <silent> <C-Up> :resize +2<CR>
nnoremap <silent> <C-Down> :resize -2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" 智能窗口分割
set splitbelow splitright

" 缩放当前窗口
nnoremap <leader>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>

" ========================================
" 高级 GIT 集成
" ========================================

" Git 快捷键（需要 vim-fugitive）
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log --oneline<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gb :Git blame<CR>

" Git gutter（需要插件）
" Plug 'airblade/vim-gitgutter'
" 在边缘显示 git 差异

" ========================================
" 代码折叠增强
" ========================================

" 智能折叠
set foldmethod=syntax
set foldlevelstart=99
set foldnestmax=10

" 切换折叠
nnoremap <space> za

" 折叠所有函数
nnoremap <leader>zf :set foldmethod=syntax<CR>zM

" 展开所有
nnoremap <leader>zu :set foldmethod=manual<CR>zR

" ========================================
" 调试功能
" ========================================

" 调试模式切换
function! ToggleDebug()
    if &verbose == 0
        set verbose=1
        echo "调试模式开启"
    else
        set verbose=0
        echo "调试模式关闭"
    endif
endfunction

nnoremap <leader>debug :call ToggleDebug()<CR>

" 显示光标下的语法高亮组
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

nnoremap <leader>syn :call SynStack()<CR>

" ========================================
" 性能优化
" ========================================

" 大文件禁用功能
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

" 宏的延迟重绘
set lazyredraw

" 更快的更新时间以获得更好的体验
set updatetime=300

" 不传递消息给 |ins-completion-menu|
set shortmess+=c

" ========================================
" 自定义函数
" ========================================

" 删除尾随空白
function! StripTrailingWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

nnoremap <leader>ss :call StripTrailingWhitespace()<CR>

" 在相对和绝对行号之间切换
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

nnoremap <leader>n :call NumberToggle()<CR>

" 保存时如果目录不存在则创建
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

" 快速文件模板插入
function! InsertFileTemplate()
    let l:ext = expand('%:e')
    let l:templates = {
        \ 'cpp': ['#include <iostream>', '', 'int main() {', '    return 0;', '}'],
        \ 'c': ['#include <stdio.h>', '', 'int main() {', '    return 0;', '}'],
        \ 'py': ['#!/usr/bin/env python3', '', 'def main():', '    pass', '', 'if __name__ == "__main__":', '    main()'],
        \ 'sh': ['#!/bin/bash', '', 'set -e', ''],
        \ 'html': ['<!DOCTYPE html>', '<html>', '<head>', '    <title></title>', '</head>', '<body>', '', '</body>', '</html>']
        \ }

    if has_key(l:templates, l:ext) && line('$') == 1 && getline(1) == ''
        call setline(1, l:templates[l:ext])
    endif
endfunction

autocmd BufNewFile * call InsertFileTemplate()

" ========================================
" 附加快捷键
" ========================================

" 快速保存和退出
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" 全选
nnoremap <leader>a ggVG

" 复制到系统剪贴板
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" 从系统剪贴板粘贴
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" 复制行
nnoremap <leader>d :t.<CR>

" 上下移动行
nnoremap <A-j> :move .+1<CR>==
nnoremap <A-k> :move .-2<CR>==
inoremap <A-j> <Esc>:move .+1<CR>==gi
inoremap <A-k> <Esc>:move .-2<CR>==gi
vnoremap <A-j> :move '>+1<CR>gv=gv
vnoremap <A-k> :move '<-2<CR>gv=gv

" 快速括号对
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko