" vim:fdm=marker
if&compatible
 set nocompatible
endif
" dein {{{
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin('~/.vim/dein')
call dein#add('Shougo/dein.vim')

call dein#add('joshdick/onedark.vim')
call dein#add('vim-airline/vim-airline')

call dein#end()
filetype plugin indent on
if dein#check_install()
  call dein#install()
endif

" }}}
" common settings {{{
set ignorecase
set smartcase
set hlsearch
set noerrorbells
set showmatch matchtime=1
set display=lastline

set autoindent
set smartindent
" }}}


" deoplete 
" let g:deoplete#enable_at_startup = 1

" color-scheme settings {{{
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif "
let g:airline_theme='onedark'
syntax on 
colorscheme onedark
" }}}



