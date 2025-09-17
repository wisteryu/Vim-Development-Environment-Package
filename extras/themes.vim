" Vim Color Themes and Visual Enhancements
" Additional theme options and visual customizations

" ========================================
" POPULAR COLOR SCHEMES
" ========================================

" Built-in themes (no plugins required)
" Uncomment one to use:

" Dark themes
" colorscheme desert       " Warm desert colors
" colorscheme darkblue     " Blue-focused dark theme
" colorscheme elflord      " Fantasy-inspired dark theme
" colorscheme koehler      " Professional dark theme
" colorscheme murphy       " High contrast dark theme
" colorscheme pablo        " Minimalist dark theme
" colorscheme ron          " Classic dark theme
" colorscheme slate        " Blue-gray theme
" colorscheme torte        " Chocolate-inspired theme

" Light themes
" colorscheme morning      " Clean light theme
" colorscheme peachpuff    " Warm light theme
" colorscheme shine        " Bright light theme

" ========================================
" PLUGIN-BASED THEMES (Requires installation)
" ========================================

" To use these themes, add the plugin lines to your .vimrc:

" One Dark (Atom-inspired)
" Plug 'joshdick/onedark.vim'
" colorscheme onedark

" Gruvbox (Retro groove colors)
" Plug 'morhetz/gruvbox'
" colorscheme gruvbox

" Solarized (Scientific color scheme)
" Plug 'altercation/vim-colors-solarized'
" colorscheme solarized

" Dracula (Dark theme with vibrant colors)
" Plug 'dracula/vim', { 'as': 'dracula' }
" colorscheme dracula

" Nord (Arctic-inspired theme)
" Plug 'arcticicestudio/nord-vim'
" colorscheme nord

" Monokai (Sublime Text theme)
" Plug 'crusoexia/vim-monokai'
" colorscheme monokai

" Material Theme
" Plug 'hzchirs/vim-material'
" colorscheme vim-material

" Ayu (Modern theme with variants)
" Plug 'ayu-theme/ayu-vim'
" set termguicolors
" let ayucolor="dark"   " Options: light, mirage, dark
" colorscheme ayu

" ========================================
" CUSTOM COLOR CONFIGURATIONS
" ========================================

" Enable true color support if available
if has('termguicolors')
    set termguicolors
endif

" Transparency settings (for terminals that support it)
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE

" Custom syntax highlighting
highlight Comment ctermfg=green guifg=#50C878
highlight String ctermfg=yellow guifg=#FFD700
highlight Number ctermfg=magenta guifg=#FF69B4
highlight Keyword ctermfg=blue guifg=#4169E1

" Enhanced cursor appearance
set cursorline
highlight CursorLine cterm=NONE ctermbg=237 guibg=#3A3A3A
highlight CursorColumn cterm=NONE ctermbg=237 guibg=#3A3A3A

" Better search highlighting
highlight Search cterm=NONE ctermfg=black ctermbg=yellow guifg=#000000 guibg=#FFFF00
highlight IncSearch cterm=NONE ctermfg=black ctermbg=red guifg=#000000 guibg=#FF0000

" Enhanced diff colors
highlight DiffAdd cterm=NONE ctermbg=22 guibg=#005500
highlight DiffChange cterm=NONE ctermbg=94 guibg=#875f00
highlight DiffDelete cterm=NONE ctermbg=52 guibg=#5f0000
highlight DiffText cterm=NONE ctermbg=130 guifg=#ffaf00

" ========================================
" STATUS LINE THEMES
" ========================================

" Simple custom status line (no plugins)
function! CustomStatusLine()
    let l:line = ''
    let l:line .= '%f'                    " File name
    let l:line .= '%m'                    " Modified flag
    let l:line .= '%r'                    " Read-only flag
    let l:line .= '%='                    " Right align
    let l:line .= '%y'                    " File type
    let l:line .= ' [%l/%L]'              " Line info
    let l:line .= ' %p%%'                 " Percentage
    return l:line
endfunction

" set statusline=%!CustomStatusLine()

" Airline themes (requires vim-airline plugin)
" let g:airline_theme='dark'            " Dark theme
" let g:airline_theme='light'           " Light theme
" let g:airline_theme='luna'            " Luna theme
" let g:airline_theme='papercolor'      " Paper color theme
" let g:airline_theme='tomorrow'        " Tomorrow theme
" let g:airline_theme='bubblegum'       " Bubblegum theme

" ========================================
" VISUAL ENHANCEMENTS
" ========================================

" Line number styling
highlight LineNr ctermfg=240 guifg=#585858
highlight CursorLineNr ctermfg=yellow guifg=#FFD700 cterm=bold gui=bold

" Matching parentheses
highlight MatchParen cterm=bold ctermbg=none ctermfg=magenta guifg=#FF00FF gui=bold

" Visual selection
highlight Visual cterm=NONE ctermbg=24 guibg=#005f87

" Tab line
highlight TabLine cterm=NONE ctermfg=15 ctermbg=242 guifg=#ffffff guibg=#6c6c6c
highlight TabLineSel cterm=bold ctermfg=15 ctermbg=236 guifg=#ffffff guibg=#303030

" Fold styling
highlight Folded cterm=italic ctermfg=244 ctermbg=235 guifg=#808080 guibg=#262626
highlight FoldColumn ctermfg=244 ctermbg=235 guifg=#808080 guibg=#262626

" ========================================
" PROGRAMMING LANGUAGE SPECIFIC COLORS
" ========================================

" C/C++ enhancements
autocmd FileType c,cpp highlight cppSTLType ctermfg=cyan guifg=#00FFFF
autocmd FileType c,cpp highlight cppAccess ctermfg=red guifg=#FF0000

" Python enhancements
autocmd FileType python highlight pythonBuiltin ctermfg=cyan guifg=#00FFFF
autocmd FileType python highlight pythonException ctermfg=red guifg=#FF0000

" JavaScript enhancements
autocmd FileType javascript highlight jsFunction ctermfg=blue guifg=#0000FF
autocmd FileType javascript highlight jsThis ctermfg=magenta guifg=#FF00FF

" HTML/CSS enhancements
autocmd FileType html highlight htmlTag ctermfg=blue guifg=#0000FF
autocmd FileType css highlight cssClassName ctermfg=yellow guifg=#FFFF00

" ========================================
" ERROR AND WARNING COLORS
" ========================================

" ALE (syntax checker) colors
highlight ALEError cterm=underline ctermfg=red guifg=#FF0000
highlight ALEWarning cterm=underline ctermfg=yellow guifg=#FFFF00
highlight ALEInfo cterm=underline ctermfg=blue guifg=#0000FF

" Sign column
highlight SignColumn ctermbg=NONE guibg=NONE

" Error signs
highlight ALEErrorSign ctermfg=red ctermbg=NONE guifg=#FF0000 guibg=NONE
highlight ALEWarningSign ctermfg=yellow ctermbg=NONE guifg=#FFFF00 guibg=NONE

" ========================================
" CUSTOM THEME FUNCTION
" ========================================

function! ApplyCustomTheme()
    " Background and foreground
    highlight Normal ctermfg=252 ctermbg=233 guifg=#d0d0d0 guibg=#121212

    " Syntax highlighting
    highlight Comment ctermfg=244 guifg=#808080 cterm=italic gui=italic
    highlight Constant ctermfg=173 guifg=#d7875f
    highlight String ctermfg=107 guifg=#87af5f
    highlight Number ctermfg=173 guifg=#d7875f
    highlight Boolean ctermfg=173 guifg=#d7875f
    highlight Identifier ctermfg=68 guifg=#5f87d7
    highlight Function ctermfg=68 guifg=#5f87d7
    highlight Statement ctermfg=111 guifg=#87afff
    highlight Keyword ctermfg=111 guifg=#87afff
    highlight PreProc ctermfg=143 guifg=#afaf5f
    highlight Type ctermfg=103 guifg=#8787af
    highlight Special ctermfg=216 guifg=#ffaf87
    highlight Error ctermfg=196 ctermbg=NONE guifg=#ff0000 guibg=NONE
    highlight Todo ctermfg=226 ctermbg=NONE guifg=#ffff00 guibg=NONE cterm=bold gui=bold

    " UI elements
    highlight StatusLine ctermfg=15 ctermbg=239 guifg=#ffffff guibg=#4e4e4e
    highlight StatusLineNC ctermfg=249 ctermbg=237 guifg=#b2b2b2 guibg=#3a3a3a
    highlight VertSplit ctermfg=237 ctermbg=237 guifg=#3a3a3a guibg=#3a3a3a
    highlight LineNr ctermfg=240 guifg=#585858
    highlight CursorLineNr ctermfg=yellow guifg=#ffff00 cterm=bold gui=bold
endfunction

" Apply custom theme
" call ApplyCustomTheme()

" ========================================
" THEME SWITCHING FUNCTIONS
" ========================================

let g:current_theme_index = 0
let g:available_themes = ['desert', 'darkblue', 'elflord', 'koehler', 'murphy', 'pablo']

function! NextTheme()
    let g:current_theme_index = (g:current_theme_index + 1) % len(g:available_themes)
    execute 'colorscheme ' . g:available_themes[g:current_theme_index]
    echo 'Theme: ' . g:available_themes[g:current_theme_index]
endfunction

function! PreviousTheme()
    let g:current_theme_index = (g:current_theme_index - 1 + len(g:available_themes)) % len(g:available_themes)
    execute 'colorscheme ' . g:available_themes[g:current_theme_index]
    echo 'Theme: ' . g:available_themes[g:current_theme_index]
endfunction

" Theme switching keybindings
nnoremap <F6> :call NextTheme()<CR>
nnoremap <S-F6> :call PreviousTheme()<CR>

" ========================================
" BACKGROUND TOGGLE
" ========================================

function! ToggleBackground()
    if &background == 'dark'
        set background=light
        echo 'Background: light'
    else
        set background=dark
        echo 'Background: dark'
    endif
endfunction

nnoremap <F7> :call ToggleBackground()<CR>

" ========================================
" USAGE INSTRUCTIONS
" ========================================

" To use these themes:
" 1. Choose a theme from the options above
" 2. Uncomment the lines for your preferred theme
" 3. Add any customizations you want
" 4. Reload your .vimrc with :source ~/.vimrc
"
" For plugin-based themes:
" 1. Add the Plug line to your .vimrc plugin section
" 2. Run :PlugInstall
" 3. Set the colorscheme
"
" Theme switching:
" - F6: Next theme
" - Shift+F6: Previous theme
" - F7: Toggle light/dark background