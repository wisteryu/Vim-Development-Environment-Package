" Advanced Vim Configuration
" Additional features not included in the main config
" Usage: Add desired sections to your main .vimrc

" ========================================
" ENHANCED VISUAL FEATURES
" ========================================

" Better color scheme options
if has('termguicolors')
    set termguicolors
endif

" Popular color schemes (uncomment one)
" colorscheme desert
" colorscheme darkblue
" colorscheme elflord
" colorscheme koehler

" Enhanced cursor
set cursorcolumn
highlight CursorLine cterm=NONE ctermbg=darkgray
highlight CursorColumn cterm=NONE ctermbg=darkgray

" Show matching parentheses with color
highlight MatchParen cterm=bold ctermbg=none ctermfg=magenta

" ========================================
" ADVANCED EDITING FEATURES
" ========================================

" Multiple cursors (requires plugin)
" Plug 'mg979/vim-visual-multi'

" Surround text objects (requires plugin)
" Plug 'tpope/vim-surround'
" Usage: cs"' (change " to '), ds" (delete "), ysiw" (surround word with ")

" Enhanced text objects (requires plugin)
" Plug 'wellle/targets.vim'
" Adds support for cin) (change in next parentheses), da, (delete around comma)

" Snippet support (requires plugin)
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" ========================================
" PRODUCTIVITY ENHANCEMENTS
" ========================================

" Session management
set sessionoptions=buffers,curdir,folds,help,options,tabpages,winsize
" Save session: :mksession ~/.vim/sessions/project.vim
" Load session: :source ~/.vim/sessions/project.vim

" Undo persistence
if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Smart indentation for different file types
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2

" Auto-reload files when changed externally
set autoread
autocmd FocusGained,BufEnter * :checktime

" ========================================
" ENHANCED SEARCH AND REPLACE
" ========================================

" Use ripgrep for grep if available
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

" Search word under cursor in project
nnoremap <leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Replace word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

" Case-insensitive search by default, case-sensitive if uppercase present
set ignorecase
set smartcase

" Highlight search results as you type
set incsearch
set hlsearch

" Clear search highlighting
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" ========================================
" ADVANCED WINDOW MANAGEMENT
" ========================================

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <silent> <C-Up> :resize +2<CR>
nnoremap <silent> <C-Down> :resize -2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" Smart window splitting
set splitbelow splitright

" Zoom current window
nnoremap <leader>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>

" ========================================
" ADVANCED GIT INTEGRATION
" ========================================

" Git keybindings (requires vim-fugitive)
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log --oneline<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gb :Git blame<CR>

" Git gutter (requires plugin)
" Plug 'airblade/vim-gitgutter'
" Shows git diff in the gutter

" ========================================
" CODE FOLDING ENHANCEMENTS
" ========================================

" Smart folding
set foldmethod=syntax
set foldlevelstart=99
set foldnestmax=10

" Toggle fold
nnoremap <space> za

" Fold all functions
nnoremap <leader>zf :set foldmethod=syntax<CR>zM

" Unfold all
nnoremap <leader>zu :set foldmethod=manual<CR>zR

" ========================================
" DEBUGGING FEATURES
" ========================================

" Debug mode toggle
function! ToggleDebug()
    if &verbose == 0
        set verbose=1
        echo "Debug mode ON"
    else
        set verbose=0
        echo "Debug mode OFF"
    endif
endfunction

nnoremap <leader>debug :call ToggleDebug()<CR>

" Show syntax highlighting groups under cursor
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

nnoremap <leader>syn :call SynStack()<CR>

" ========================================
" PERFORMANCE OPTIMIZATIONS
" ========================================

" Disable features for large files
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

" Lazy redraw for faster macros
set lazyredraw

" Faster updatetime for better experience
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" ========================================
" ADDITIONAL PLUGINS SUGGESTIONS
" ========================================

" Commenting made easy
" Plug 'preservim/nerdcommenter'

" Enhanced status line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" File icons (requires nerd fonts)
" Plug 'ryanoasis/vim-devicons'

" Indent guides
" Plug 'Yggdroot/indentLine'

" Markdown preview
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" REST client
" Plug 'diepm/vim-rest-console'

" Database client
" Plug 'tpope/vim-dadbod'
" Plug 'kristijanhusak/vim-dadbod-ui'

" ========================================
" LANGUAGE-SPECIFIC ENHANCEMENTS
" ========================================

" Python
autocmd FileType python setlocal colorcolumn=88
autocmd FileType python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

" C/C++
autocmd FileType c,cpp setlocal colorcolumn=80
autocmd FileType c,cpp nnoremap <buffer> <F9> :w<cr>:!gcc % -o %:r && ./%:r<cr>

" JavaScript/TypeScript
autocmd FileType javascript,typescript setlocal colorcolumn=100
autocmd FileType javascript nnoremap <buffer> <F9> :exec '!node' shellescape(@%, 1)<cr>

" Go
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nnoremap <buffer> <F9> :w<cr>:!go run %<cr>

" Rust
autocmd FileType rust nnoremap <buffer> <F9> :w<cr>:!cargo run<cr>

" ========================================
" CUSTOM FUNCTIONS
" ========================================

" Strip trailing whitespace
function! StripTrailingWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

nnoremap <leader>ss :call StripTrailingWhitespace()<CR>

" Toggle between relative and absolute line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

nnoremap <leader>n :call NumberToggle()<CR>

" Create directory if it doesn't exist when saving
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

" Quick file template insertion
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
" ADDITIONAL KEYBINDINGS
" ========================================

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Select all
nnoremap <leader>a ggVG

" Copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Paste from system clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Duplicate line
nnoremap <leader>d :t.<CR>

" Move lines up/down
nnoremap <A-j> :move .+1<CR>==
nnoremap <A-k> :move .-2<CR>==
inoremap <A-j> <Esc>:move .+1<CR>==gi
inoremap <A-k> <Esc>:move .-2<CR>==gi
vnoremap <A-j> :move '>+1<CR>gv=gv
vnoremap <A-k> :move '<-2<CR>gv=gv

" Quick bracket pairs
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko