" vim:fdm=marker
if&compatible
	set nocompatible
endif
" Plugs {{{ 
call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
filetype plugin indent on
" }}}

" go setting {{{
if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
endif

let g:go_fmt_command = "goimports"
" we have lsp, so off funcs
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
" }}}

" common settings {{{
set number
set ignorecase
set smartcase
" set hlsearch
set noerrorbells
set showmatch matchtime=1
set display=lastline
set cursorline

set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set noexpandtab

set whichwrap=b,s,[,],<,>
" }}}

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
