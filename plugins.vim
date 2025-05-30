" plugins.vim
call plug#begin('~/.config/nvim/autoload/plugged')

    " -- main plugins --
    Plug 'junegunn/vim-easy-align'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'

    " additional
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'pbrisbin/vim-colors-off'
    Plug 'junegunn/fzf.vim'

call plug#end()

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" fzf
nnoremap <C-p> :FZF <CR>
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>ps :RG<CR>
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-l> <plug>(fzf-complete-line)

" undotree
nnoremap <Leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    let target_path = expand('$HOME/.config/nvim/.undodir')
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

