-- general
vim.opt.wrap = false
vim.opt.number  = true
vim.opt.relativenumber = true

-- statusline
vim.opt.laststatus = 2

-- look
vim.opt.signcolumn = 'no'
vim.opt.guicursor = ""
vim.opt.termguicolors = true

-- indentation
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true

-- incremental search only
vim.opt.hlsearch  = true
vim.opt.incsearch = true

-- avoid swapfile
-- undodir (plug) access only
vim.opt.backup   = false
vim.opt.swapfile = false
vim.opt.undodir  = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50
vim.opt.mouse = ""

-- netrw
vim.g.netrw_banner = 0;
vim.o.scrolloff = 8
