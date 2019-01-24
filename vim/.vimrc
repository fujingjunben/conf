" Vundle
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternativily, pass a path where Vundle should install plugins
    " call vundle#begin("~/som/path/here")

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " The following are example of diferent formats supported.
    " Keep Plugin commands between vundle@begin/end
    " Plugin on GitHub repo
    Plugin 'scrooloose/nerdtree'
    Plugin 'bling/vim-airline'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'moll/vim-node'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'klen/python-mode'
    
call vundle#end()
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
language messages zh_CN.utf-8
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


