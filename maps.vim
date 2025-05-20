" mappings

let mapleader = " "

" buffer
nnoremap [b :bprevious <CR>
nnoremap ]b :bnext <CR>

nnoremap <C-t> :tabnew <CR>
nnoremap [t :tabprevious <CR>
nnoremap ]t :tabnext <CR>

nnoremap <Leader>pv :Ex<CR>
nnoremap <Leader>h :nohl<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
xnoremap <Leader>p "_dP
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
nnoremap Q <nop>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <Leader>x :!chmod +x %<CR>
nnoremap <Leader>w :!./%<CR>
