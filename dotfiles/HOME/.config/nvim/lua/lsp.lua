-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "pyright", "tailwindcss", "html", "cssls", "emmet_ls" },
})

-- Better icons for diagnostics
local severity = vim.diagnostic.severity
vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = "󰅚 ",
      [severity.WARN] = "󰀪 ",
      [severity.HINT] = "󰋽 ",
      [severity.INFO] = "󰌶 ",
    },
  },
})
