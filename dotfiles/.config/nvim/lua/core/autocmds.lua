local aug = vim.api.nvim_create_augroup
local auc = vim.api.nvim_create_autocmd



-- format on save (Conform first, LSP fallback)
auc("BufWritePre", {
  group = aug("format_on_save", {}),
  callback = function()
    local ok = pcall(function() require("conform").format({ lsp_fallback = true, quiet = true }) end)
    if not ok and vim.lsp.buf.format then
      pcall(vim.lsp.buf.format)
    end
  end,
})
