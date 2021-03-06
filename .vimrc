" Don't try to be vi compatible
set nocompatible
" Helps force plugins to load correctly when it is turned back on below
set number
filetype off
""Plugins"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mcmartelle/vim-monokai-bold'
" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'
" Automatically clear search highlights after you move your cursor.
Plug 'junegunn/limelight.vim'
"File Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Syntax highlighters
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'cakebaker/scss-syntax.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'vim-python/python-syntax'
Plug 'neoclide/coc.nvim'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""
"prettier

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" git gutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
" open NERDTree at the beginning
" autocmd VimEnter * NERDTree
" focus to editor
" autocmd VimEnter * wincmd p
" exit also from file explorer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())| q | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }"
""""""""""
let g:coc_disable_startup_warning = 1
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on
let mapleader = "," 

" Security
set modelines=0
" Show file stats
set ruler
" Blink cursor on error instead of beeping (grr)
set visualbell
" Encoding
set encoding=utf-8
" Whitespace
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
" Cursor motion
set scrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" Allow hidden buffers
set hidden
" Rendering
set ttyfast
" Status bar
set laststatus=2
" Last line
set showmode
set showcmd
" Searching
nnoremap / /\v
vnoremap / /\v
set noeb vb t_vb=
set hlsearch
set incsearch
set ignorecase
set smartcase
" set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
" Color scheme (terminal)
set t_Co=256
" Enable 24-bit true colors if your terminal supports it.
set autoindent


imap jj <ESC>
" colorscheme slate
colorscheme monokai-bold
let g:NERDTreeWinPos="right"
