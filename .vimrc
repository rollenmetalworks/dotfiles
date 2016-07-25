""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
let g:python_host_prog='/usr/local/bin/python'

Plug 'ctrlpvim/ctrlp.vim'                               " Autocomplete
Plug 'mattn/emmet-vim'                                  " Fancy html shortcuts to edit tags
Plug 'scrooloose/nerdtree'                              " Project viewer
Plug 'tpope/vim-fugitive'                               " git
Plug 'tpope/vim-surround'                               " Change brackets
Plug 'rking/ag.vim'                                     " Search for stuff in files, like grep
Plug 'tpope/vim-unimpaired'                             " logical aliases for pairs
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'     " snippets controller | default snippeds
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' } " Plugin to coordinate completion engines
Plug 'junegunn/vim-easy-align'                          " Align text like this awesome row of \"'s
Plug 'plasticboy/vim-markdown'                          " Markdown editor
Plug 'junegunn/goyo.vim'                                " Distraction Free writing in vim
Plug 'reedes/vim-pencil'                                " using vim to write stuff
Plug 'reedes/vim-lexical'                               " Spell checking
Plug 'pangloss/vim-javascript'                          " Javascript syntax / highlighting
Plug 'mxw/vim-jsx'                                      " JSX file syntax / hignlighting
Plug 'hail2u/vim-css3-syntax'                           " CSS3 highlighting
Plug 'editorconfig/editorconfig-vim'                    " Load editorconfig
Plug 'neomake/neomake'                                  " non blocking make
Plug 'leafgarland/typescript-vim'                       " typescript syntax highlighting
Plug 'Shougo/vimproc.vim', { 'do': 'make' }             " Vim Proc
Plug 'Quramy/tsuquyomi'                                 " hopefully error reporting for typescript

" Plug 'scrooloose/syntastic'                             " synta checker

" Add plugins to &runtimepath
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader to space
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
let g:user_emmet_leader_key='<C-e>'

set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set cursorline in current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"turn off highlighting
set nohls

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Hotkeys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :CtrlP<cr>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "ignore files from gitignore


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
inoremap <c-c> <nop>
inoremap <c-[> <nop>
nnoremap <c-w><c-w> <nop>
" }}}


" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


augroup markdownediting
	autocmd!
	" Mardown shortcuts
	au! BufRead,BufNewFile *.markdown set filetype=mkd
	au! BufRead,BufNewFile *.md       set filetype=mkd
	au! BufWritePost README.md :echom 'writing' | !pandoc -t html -f markdown % -o README.html
	au! FileType mkd call SetCopyBuffer()
	"autocmd FileType markdown,mkd call pencil#init()
				" \ | call lexical#init()
	autocmd FileType text         call pencil#init()
augroup END

function! SetCopyBuffer()
	nnoremap <leader>s :!cat README.html\|pbcopy<cr>
endfunction

" Ultiship expanding
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" Syntastic configs
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0 
"let g:syntastic_check_on_open = 0 
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jshint']

" Change quickfix color
hi Search cterm=NONE ctermfg=white ctermbg=blue

" Neomake configs
let g:neomake_typescript_tsc_maker = {}
autocmd! BufWritePost * Neomake!
