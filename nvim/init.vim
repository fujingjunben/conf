" basic config
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu

" enable saving of tab titles for sessions
set sessionoptions+=tabpages,globals

set tabstop=8
set softtabstop=8
set autoindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'voldikss/vim-floaterm'

" Collection of common configurations for the Nvim LSP client
"Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
"Plug 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'
Plug 'rust-lang/rust.vim'

" save session
Plug 'tpope/vim-obsession'


Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

Plug 'gcmt/taboo.vim'

Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

Plug 'TaDaa/vimade'

Plug 'morhetz/gruvbox'

Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'

Plug 'camspiers/lens.vim'

Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\}
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='gruvbox'

"""""""""""""""""""""""""""""""""""""""""""""""""""
" THEME 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_termcolors = 16
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF-VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMADE
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimade = {}
let g:vimade.fadelevel = 0.1
let g:vimade.basebg = [75, 75, 75]


""""""""""""""""""""""""""""""
" RNVIMR
""""""""""""""""""""""""""""""

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(1.0 * &columns)),
            \ 'height': float2nr(round(0.42 * &lines)),
            \ 'col': float2nr(round(0.0 * &columns)),
            \ 'row': float2nr(round(0.54 * &lines)),
            \ 'style': 'minimal'
            \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                  " VIM FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" code/string searching tool for multifile exploration
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': ':r !echo',
  \ }

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

""""""""""""""""""""""""""""""
" VIM-FLOATERM
""""""""""""""""""""""""""""""

let g:floaterm_open_command = 'tabe'

"""""""""""""""""""""""""""""
" DEOPLETE
"""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                 " KEY REMAPS 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enables ripgrep for file completion via fzf
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Maps leader to the spacebar
map <Space> <Leader>

nnoremap   <silent>   <F9>    :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F10>    :FloatermNext<CR>
tnoremap   <silent>   <F10>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
tnoremap   <silent>   <F11>   <C-\><C-n><CR>

nnoremap   <C-c><C-c> :FloatermSend<CR>
vnoremap   <C-c><C-c> :FloatermSend<CR>

" Maps easymotion jumps for lines
map <leader><space>l <Plug>(easymotion-bd-jk)
nmap <leader><space>l <Plug>(easymotion-overwin-line)

" Maps easymotion jumps for words
map  <leader><Space>w <Plug>(easymotion-bd-w)
nmap <leader><Space>w <Plug>(easymotion-overwin-w)

" Maps Ranger 
nmap <leader><Space>r :RnvimrToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rust.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" set up completion-nvim for all buffers instead of only being used when lsp
" is enabled
autocmd BufEnter * lua require'completion'.on_attach()

" use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"lua <<EOF
"require'lspconfig'.rust_analyzer.setup{
"    settings = {
"      ["rust-analyzer"] = {}
"    }
"}
"EOF

" Code navigation shortcuts
" as found in :help lsp
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
" rust-analyzer does not yet support goto declaration
" re-mapped `gd` to definition
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
            \ 'rust': ['rust-analyzer'],
	    \ 'cpp' : ['clangd'],
	    \ 'c' : ['clangd'],
            \ }

nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
