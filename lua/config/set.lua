
vim.cmd.colorscheme("vim")

vim.g.netrw_banner=false
vim.opt.expandtab=true
vim.opt.laststatus=1
vim.opt.mouse=""
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.shiftwidth=4
vim.opt.smartindent=true
vim.opt.softtabstop=4
vim.opt.tabstop=4
vim.opt.tgc=false
vim.opt.wildmenu=true
vim.wo.linebreak=true
vim.wo.list=false
vim.wo.wrap=false
vim.o.signcolumn="number"

vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})


