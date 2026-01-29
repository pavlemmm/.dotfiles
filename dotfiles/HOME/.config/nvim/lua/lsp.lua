-- Mason
-- require("mason").setup()
-- require("mason-lspconfig").setup({
--   ensure_installed = { "lua_ls", "ts_ls", "pyright", "tailwindcss", "html", "cssls", "emmet_ls" },
-- })

local servers = { "lua_ls", "ts_ls", "pyright", "tailwindcss", "html", "cssls", "emmet_ls" }

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

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
