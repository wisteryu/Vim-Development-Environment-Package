" Additional Vim Plugins Collection
" Extra plugins not included in the main configuration
" Add desired plugins to your main .vimrc

" ========================================
" PLUGIN MANAGEMENT
" ========================================

" Add these lines to your .vimrc between call plug#begin() and call plug#end()

" ========================================
" CODE EDITING ENHANCEMENTS
" ========================================

" Multiple cursors for simultaneous editing
" Plug 'mg979/vim-visual-multi'
" Usage: Ctrl+n to select words, Ctrl+Down/Up for vertical cursors

" Surround text with quotes, brackets, etc.
" Plug 'tpope/vim-surround'
" Usage: cs"' (change " to '), ds" (delete "), ysiw" (surround word with ")

" Enhanced text objects
" Plug 'wellle/targets.vim'
" Adds support for cin) (change in next parentheses), da, (delete around comma)

" Auto-close brackets and quotes
" Plug 'jiangmiao/auto-pairs'
" Automatically inserts closing brackets, quotes, etc.

" Expand abbreviations (like emmet for HTML)
" Plug 'mattn/emmet-vim'
" Usage: Type div.container and press Ctrl+Y,

" Snippet engine
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Usage: Type snippet trigger and press Tab

" ========================================
" NAVIGATION AND SEARCH
" ========================================

" Enhanced file navigation
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'  " Git integration for NERDTree

" Fuzzy finding
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" More powerful than CtrlP

" Jump to any location with 2 characters
" Plug 'easymotion/vim-easymotion'
" Usage: ,,w to jump to word starts

" Show indentation levels
" Plug 'Yggdroot/indentLine'
" Visual guides for indentation

" Enhanced search highlighting
" Plug 'haya14busa/incsearch.vim'
" Better incremental search

" ========================================
" GIT INTEGRATION
" ========================================

" Advanced Git integration (already included in main config)
" Plug 'tpope/vim-fugitive'

" Show git diff in the gutter
" Plug 'airblade/vim-gitgutter'
" Shows +, -, ~ for added, removed, modified lines

" Git commit browser
" Plug 'junegunn/gv.vim'
" Usage: :GV to open commit browser

" Git blame in virtual text
" Plug 'f-person/git-blame.nvim'
" Shows git blame information inline

" ========================================
" LANGUAGE SUPPORT
" ========================================

" Enhanced C++ syntax
" Plug 'octol/vim-cpp-enhanced-highlight'
" Better C++ syntax highlighting

" Python enhancements
" Plug 'vim-python/python-syntax'
" Plug 'Vimjas/vim-python-pep8-indent'
" Enhanced Python support

" Rust support
" Plug 'rust-lang/rust.vim'
" Official Rust plugin

" Go support
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Comprehensive Go development

" JavaScript/TypeScript
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Enhanced JS/TS support

" HTML/CSS enhancements
" Plug 'othree/html5.vim'
" Plug 'hail2u/vim-css3-syntax'
" Modern web development

" Markdown support
" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Enhanced markdown editing and live preview

" JSON syntax
" Plug 'elzr/vim-json'
" Better JSON support

" YAML syntax
" Plug 'stephpy/vim-yaml'
" Enhanced YAML support

" ========================================
" DEVELOPMENT TOOLS
" ========================================

" REST client in Vim
" Plug 'diepm/vim-rest-console'
" Usage: Write HTTP requests and execute them

" Database client
" Plug 'tpope/vim-dadbod'
" Plug 'kristijanhusak/vim-dadbod-ui'
" SQL database interaction

" Terminal integration
" Plug 'voldikss/vim-floaterm'
" Floating terminal windows

" Task runner
" Plug 'tpope/vim-dispatch'
" Run builds and tests asynchronously

" Code documentation generator
" Plug 'kkoomen/vim-doge'
" Generate documentation templates

" ========================================
" VISUAL ENHANCEMENTS
" ========================================

" File type icons (requires Nerd Fonts)
" Plug 'ryanoasis/vim-devicons'
" Adds file icons to NERDTree and other plugins

" Color scheme collections
" Plug 'flazz/vim-colorschemes'
" Large collection of color schemes

" Rainbow parentheses
" Plug 'luochen1990/rainbow'
" Different colors for nested parentheses

" Highlight colors in CSS
" Plug 'ap/vim-css-color'
" Shows actual colors for CSS color codes

" Better status line (already in main config)
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Smooth scrolling
" Plug 'psliwka/vim-smoothie'
" Animated scrolling

" ========================================
" PRODUCTIVITY TOOLS
" ========================================

" Session management
" Plug 'tpope/vim-obsession'
" Automatic session management

" Quick commenting
" Plug 'preservim/nerdcommenter'
" Easy code commenting

" Repeat plugin commands with .
" Plug 'tpope/vim-repeat'
" Extends . command for plugins

" Change dates quickly
" Plug 'tpope/vim-speeddating'
" Increment/decrement dates with Ctrl+A/X

" File templates
" Plug 'tibabit/vim-templates'
" Automatic file templates

" Distraction-free writing
" Plug 'junegunn/goyo.vim'
" Minimalist writing environment

" ========================================
" TESTING AND DEBUGGING
" ========================================

" Unit testing
" Plug 'vim-test/vim-test'
" Run tests from Vim

" Code coverage
" Plug 'ruanyl/coverage.vim'
" Display test coverage

" Debugger integration
" Plug 'puremourning/vimspector'
" Multi-language debugger

" ========================================
" SPECIFIC USE CASES
" ========================================

" Note-taking
" Plug 'vimwiki/vimwiki'
" Personal wiki in Vim

" Todo management
" Plug 'aserebryakov/vim-todo-lists'
" Manage todo lists

" Time tracking
" Plug 'wakatime/vim-wakatime'
" Track coding time

" Presentation mode
" Plug 'sotte/presenting.vim'
" Create presentations in Vim

" ========================================
" CONFIGURATION EXAMPLES
" ========================================

" Example configurations for popular plugins:

" FZF configuration
" nnoremap <C-p> :Files<CR>
" nnoremap <C-b> :Buffers<CR>
" nnoremap <C-g> :Rg<CR>

" NERDTree configuration
" nnoremap <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeShowHidden=1
" let g:NERDTreeIgnore=['\\.pyc$', '\\.git$', '\\.DS_Store$']

" GitGutter configuration
" let g:gitgutter_enabled=1
" let g:gitgutter_map_keys=0
" nnoremap <leader>gg :GitGutterToggle<CR>

" Emmet configuration
" let g:user_emmet_leader_key='<C-Z>'
" let g:user_emmet_install_global=0
" autocmd FileType html,css EmmetInstall

" UltiSnips configuration
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Markdown preview configuration
" let g:mkdp_auto_start=1
" let g:mkdp_auto_close=1
" let g:mkdp_refresh_slow=1

" ========================================
" INSTALLATION NOTES
" ========================================

" To install any of these plugins:
" 1. Add the Plug line to your .vimrc between plug#begin() and plug#end()
" 2. Restart Vim or run :source ~/.vimrc
" 3. Run :PlugInstall
" 4. Add any configuration options
" 5. Restart Vim

" To remove a plugin:
" 1. Remove the Plug line from your .vimrc
" 2. Run :PlugClean

" To update plugins:
" Run :PlugUpdate

" ========================================
" PERFORMANCE CONSIDERATIONS
" ========================================

" Some plugins can slow down Vim, especially:
" - Heavy syntax highlighting plugins
" - Plugins that run on every keystroke
" - File watchers and auto-completion

" Tips for better performance:
" - Use lazy loading where possible: Plug 'plugin', { 'on': 'Command' }
" - Disable plugins for large files
" - Profile startup time with: vim --startuptime startup.log
" - Use :PlugStatus to check plugin load times

" ========================================
" RECOMMENDED STARTER SETS
" ========================================

" Minimal enhancement set:
" Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'
" Plug 'preservim/nerdcommenter'

" Web development set:
" Plug 'mattn/emmet-vim'
" Plug 'othree/html5.vim'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'pangloss/vim-javascript'

" System programming set:
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'rust-lang/rust.vim'
" Plug 'fatih/vim-go'

" Python development set:
" Plug 'vim-python/python-syntax'
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'vim-test/vim-test'

" Git workflow set:
" Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'
" Plug 'tpope/vim-fugitive'