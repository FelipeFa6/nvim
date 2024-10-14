" custom
set path+=**
set wildmenu

set signcolumn=no
filetype plugin on

set number
set relativenumber
set cursorline

set tgc
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" netrw
let g:netrw_banner=0
let g:netrw_list_hide=netrw_gitignore#Hide()
