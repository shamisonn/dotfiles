if&compatible
 set nocompatible
endif
call plug#begin('~/.vim/plugged')
" theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
" lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" html
Plug 'alvan/vim-closetag'
" vue
Plug 'posva/vim-vue'
call plug#end()

" html
let g:closetag_filenames = '*.html'

" php
if executable('intelephense')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'intelephense',
				\ 'cmd': {server_info->['intelephense', '--stdio']},
				\ 'initialization_options': {"storagePath": "/tmp/intelephense"},
				\ 'whitelist': ['php'],
				\ })	
endif
let g:php_baselib = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags = 1
let g:php_sql_query = 1
let g:sql_type_default = 'mysql'
" vue
if executable('vls')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'vue language server',
				\ 'cmd': { server_info->['vls']},
				\ 'whitelist': ['vue'],
				\ 'initialization_options': {
				\     'config': {'html': {},'vetur': {'validation': {}}}
				\   },
				\ })
endif
" ts, js
if executable('javascript-typescript-stdio')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'javascript support using javascript-typescript-stdio',
				\ 'cmd': { server_info->['javascript-typescript-stdio']},
				\ 'whitelist': ['javascript', 'javascript.jsx']
				\ })
endif

" golang
if executable('go-langserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'go-langserver',
				\ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
				\ 'whitelist': ['go'],
				\ })
endif
let g:lsp_async_completion = 1

set shiftwidth=4
set tabstop=4
set smartindent
set expandtab
set number
set ambiwidth=double "2byte文字対応
set whichwrap=h,l,b,s,<,>,[,]

let g:airline_theme='onedark'
syntax on 
colorscheme onedark
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" use 256 colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" mouse
set mouse=a

