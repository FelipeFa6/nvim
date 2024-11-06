call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'RRethy/base16-nvim'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
    
    " lsp
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" lsp
let g:lsp_fold_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>gr <plug>(lsp-rename)

    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


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

" treesitter
lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx", "php" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true, },
    indent = { enable = true }
})
EOF

" harpoon
lua << EOF
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
EOF

" html hex colorizer
lua << EOF
require'colorizer'.setup()
EOF
