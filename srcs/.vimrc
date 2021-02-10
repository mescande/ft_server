set nu
syntax on
set ruler
set mouse=a
set colorcolumn=81

set termguicolors
colo horizon
set background=dark

set relativenumber

set tabstop=4
set shiftwidth=4
set autoindent
set cindent

autocmd BufEnter * syntax match cType "\<[t]_\w\+\>"
autocmd BufEnter * syntax match cInclude "\<[s]_\w\+\>"
