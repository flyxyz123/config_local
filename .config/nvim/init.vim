set number
language en_US

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space

" read chinese characters
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8

" don't generate those three types of files
set nobackup
set noswapfile
set noundofile

" disable auto line break (tc) and insert comment (cro)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t

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

set statusline+=%f          "can also 1CTRL+G to show full path
set statusline+=%=          "left/right separator
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%      "not sure diff. bet. p and P
set statusline+=\ %l:%c

" some nonsense for testing
