syntax on
" Show line number 
set number
set relativenumber

" Set cursor line for current line
set cursorline

" Enable copy to system clipboard with xclip
set clipboard=unnamed,unnamedplus

" Enable editor theme
colorscheme koehler

" Configure backspace to work like normal
set backspace=indent,eol,start

" Highlight search results
set hlsearch

" Turn on wild menu
set wildmenu

" Set Escape shorts
inoremap <M-j> <Esc>
inoremap <M-k> <Esc>

" Alternate way to save
nnoremap <C-s> :w<CR>

" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Converts tabs to spaces
set expandtab

" Insert 4 spaces for a tab
set tabstop=4 
set softtabstop=4             
set shiftwidth=4

" Auto indent for new line
set smartindent
set autoindent

" Configure text encoding
set encoding=utf-8
set fileencoding=utf-8