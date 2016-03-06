""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
let g:python_host_prog='/usr/local/bin/python'

" Bundle 'wincent/Command-T'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Add plugins to &runtimepath
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exit from insertmode/vmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <c-u> <esc>viwUi
inoremap ;j <esc>
vnoremap ;j  <esc>
nnoremap <c-u> viwU<esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editing vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" ctrl-p extensions
nnoremap <leader>T :CtrlP<cr>

" Make buffer movement keys
nnoremap L <c-w>l
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h

" Kill keys -----{{{
inoremap <esc> <nop>
inoremap <c-c> <nop>
inoremap <c-[> <nop>
nnoremap <c-w><c-w> <nop>
" }}}
