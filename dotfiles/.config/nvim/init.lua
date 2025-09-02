-- Set leader early
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Core configs (English comments)
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Plugins (import every module from lua/plugins)
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  ui = { border = "rounded" },
  checker = { enabled = false },
})
