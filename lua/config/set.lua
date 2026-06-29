vim.g.netrw_banner = false

vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.laststatus = 1
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.wildmenu = true

vim.wo.linebreak = true
vim.wo.list = false
vim.wo.wrap = false

vim.opt.formatoptions:remove({ "c", "r", "o" })
