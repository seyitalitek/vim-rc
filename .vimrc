" Don't try to be vi compatible
set nocompatible
" Helps force plugins to load correctly when it is turned back on below
set number
set formatprg=clang-format
filetype off
""Plugins"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Beautify js, json, css and html files
Plug 'maksimr/vim-jsbeautify'
" Integrate fzf with Vim.
Plug '~/.fzf'
Plug 'junegunn/fzf'
" Highlight which character to jump to when using horizontal movement keys.
Plug 'unblevable/quick-scope'
" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'
" Automatically clear search highlights after you move your cursor.
Plug 'junegunn/limelight.vim'
"File Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" git gutter
Plug 'airblade/vim-gitgutter'
"Syntax highlighters
Plug 'maxmellon/vim-jsx-pretty'
Plug 'cakebaker/scss-syntax.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-rails'
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
autocmd VimEnter * NERDTree
" focus to editor
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())| q | endif
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
set cursorline

" For plugins to load correctly
filetype plugin indent on
let mapleader = "," 

" Security
set modelines=0
" Show file stats
set ruler
" Blink cursor on error instead of beeping (grr)
" set visualbell
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


" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
" Color scheme (terminal)
set t_Co=256
" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif
"set background=dark
let g:solarized_termcolors=16
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
"autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox
set background=dark
set autoindent


" jsbeautify
"map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" compile and run
"
autocmd filetype python nnoremap <F4> :w <bar> exec '!clear && python3 '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!clear && gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clear && g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype javascript nnoremap <F4> :w <bar> exec '!clear && node '.shellescape('%')<CR>


" escape key
"
imap jj <ESC>
nmap gqa gggqG
nmap <F3> :%!clang-format<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!clear && g++ *.cpp && ./a.out'<CR>


nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" move the lines up and down

nnoremap <C-u> ddkkp
nnoremap <C-b> ddp
inoremap () ()<ESC>i
inoremap "" ""<ESC>i
inoremap '' ''<ESC>i
inoremap [] []<ESC>i
inoremap {} {}<ESC>i

