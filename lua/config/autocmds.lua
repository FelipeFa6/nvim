-- ~/.config/nvim/lua/config/autocmds.lua

local autocmd_group = vim.api.nvim_create_augroup("TexMake", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = autocmd_group,
  pattern = "*.tex",
  desc = "Ejecutar make al guardar archivo .tex (async)",
  callback = function()
    vim.system({ "make" }, { text = true }, function(obj)
      vim.schedule(function()
        if obj.code ~= 0 then
          vim.notify("make falló:\n" .. (obj.stderr or ""), vim.log.levels.ERROR)
        else
          vim.notify("make OK", vim.log.levels.INFO)
        end
      end)
    end)
  end,
})
