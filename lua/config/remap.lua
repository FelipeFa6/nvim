-- Set mapleader
vim.g.mapleader = " "

-- Keymap options
local opts = { noremap = true, silent = true }

-- Tab navigation
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', opts)
vim.keymap.set('n', '[t', ':tabprevious<CR>', opts)
vim.keymap.set('n', ']t', ':tabnext<CR>', opts)

-- Buffer navigation
vim.keymap.set('n', '[b', ':bprevious<CR>', opts)
vim.keymap.set('n', ']b', ':bnext<CR>', opts)

-- File explorer and search highlights
vim.keymap.set('n', '<Leader>pv', ':Ex<CR>', opts)
vim.keymap.set('n', '<Leader>h', ':nohl<CR>', opts)

-- Visual mode line movement
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Better join with cursor position
vim.keymap.set('n', 'J', 'mzJ`z', opts)

-- Scrolling keeps cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Search result centering
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Paste without overwriting register
vim.keymap.set('x', '<Leader>p', '"_dP', opts)

-- Yank to system clipboard
vim.keymap.set('n', '<Leader>y', '"+y', opts)
vim.keymap.set('v', '<Leader>y', '"+y', opts)
vim.keymap.set('n', '<Leader>Y', '"+Y', opts)

-- Disable Ex mode
vim.keymap.set('n', 'Q', '<nop>', opts)

-- Substitute word under cursor
vim.keymap.set('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { noremap = true })

-- Make current file executable
vim.keymap.set('n', '<Leader>x', ':!chmod +x %<CR>', opts)

-- Run current file
vim.keymap.set('n', '<Leader>w', ':!./%<CR>', opts)

