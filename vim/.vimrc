" vim-plug
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
call plug#begin()
    Plug 'scrooloose/nerdtree'
    Plug 'bling/vim-airline'
    Plug 'altercation/vim-colors-solarized'
    Plug 'moll/vim-node'
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    "Plugin 'klen/python-mode'
    
call plug#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
" filetype plugin on

" NERDTree
map <F3> :NERDTreeToggle<CR>

set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set nu 
set autoindent
set cindent
let &termencoding=&encoding
set fileencodings=utf-i,gbk
set number
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"language messages zh_CN.utf-8
set showmatch
set incsearch
set clipboard+=unnamed
set ruler
syntax enable
colorscheme solarized
if has('gui_running')
    set background=dark
else
    set background=dark
endif

set guifont=Source\ Code\ Pro\ 12

