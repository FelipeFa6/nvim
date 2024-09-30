call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'RRethy/base16-nvim'
    Plug 'junegunn/fzf.vim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugiti'

    " lsp
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete.vim'

call plug#end()

" lsp
let g:asyncomplete_auto_popup = 0
imap <buffer><C-x><C-o> <Plug>(asyncomplete_force_refresh)

nmap <buffer> K <plug>(lsp-hover)
nmap <buffer> gd <plug>(lsp-definition)
nmap <buffer> gs <plug>(lsp-document-symbol-search)
nmap <buffer> gr <plug>(lsp-references)
nmap <buffer> gi <plug>(lsp-implementation)
nmap <buffer> gt <plug>(lsp-type-definition)
nmap <buffer> <leader>gr <plug>(lsp-rename)

" fzf
nnoremap <C-p> :FZF <CR>
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>ps :RG<CR>

"undotree
nnoremap <Leader>u :UndotreeToggle<CR>
