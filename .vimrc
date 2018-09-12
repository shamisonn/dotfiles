if &compatible
 set nocompatible
endif
" begin dein
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/.vim/dein')
call dein#add('Shougo/dein.vim')

" atom-dark
call dein#add('gosukiwi/vim-atom-dark')
" deoplete
" call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
"   call dein#add('roxma/nvim-yarp')
"   call dein#add('roxma/vim-hug-neovim-rpc')
endif

" end dein
call dein#end()
filetype plugin indent on
if dein#check_install()
  call dein#install()
endif

" common settings
set number
set ignorecase
set smartcase
set hlsearch
set noerrorbells
set showmatch matchtime=1
set display=lastline

set tabstop=2
set autoindent
set smartindent

" deoplete 
let g:deoplete#enable_at_startup = 1

" enable color-scheme
syntax enable
if !has('gui_running')
	colorscheme atom-dark
endif

