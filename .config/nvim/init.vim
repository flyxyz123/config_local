set number
language en_US

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space

" read chinese characters, first line might not work, use 2nd line then. 2nd line seems is default to neovim but not vim 
" set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8

" don't generate those three types of files
set nobackup
set noswapfile
set noundofile

" set dir to current editing file's dir 
set autochdir

" vim-plug
" call plug#begin()
" Plug 'preservim/nerdtree'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'vim-airline/vim-airline' 
" call plug#end()

" map ctrl+h/j/k/l to move between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" search case sensitive only if have uppercase
set ignorecase
set smartcase

" default statusline:set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set statusline+=%<
set statusline+=%f          " %F or 1CTRL+G to show full path
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \[%{&fileformat}\]
set statusline+=\ %-10.(%l,%c%V%)
set statusline+=\ %P

" moving in long line
nnoremap k gk
nnoremap j gj

" disable auto line break (tc) and insert comment (cro)
filetype plugin on  " seems nvim needs this for next line of code to work? 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
