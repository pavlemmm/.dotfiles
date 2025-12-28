-- Format command ":Format"
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format()
end, {})

-- Autocommand to format before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if vim.lsp.buf.format then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- Cd where the file is ":CdFile"
vim.api.nvim_create_user_command("CdFile", function()
  local current_file = vim.fn.expand('%:p')
  local directory = vim.fn.fnamemodify(current_file, ':h')
  vim.cmd('lcd ' .. directory)
  print("Cd to: " .. directory)
end, {})

-- Autocommand to autosave on focus lost (default)
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  group = vim.api.nvim_create_augroup("AutoSaveFocus", { clear = true }),
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent! write")
    end
  end,
})

-- Toggle autocommand to autosave on text change / insert leave ":ToggleAutoSaveEdit"
local autosave_group = vim.api.nvim_create_augroup("AutoSaveEdit", { clear = true })

vim.api.nvim_create_user_command("ToggleAutoSaveEdit", function()
  local cmds = vim.api.nvim_get_autocmds({ group = autosave_group })

  if #cmds > 0 then
    vim.api.nvim_clear_autocmds({ group = autosave_group })
    vim.notify("Autosave on edit: OFF")
  else
    vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
      group = autosave_group,
      callback = function()
        if vim.bo.modified then
          vim.cmd("silent! write")
        end
      end,
    })
    vim.notify("Autosave on edit: ON")
  end
end, {})

-- Toggle command for inlay hints ":ToggleInlayHints"
vim.api.nvim_create_user_command("ToggleInlayHints", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
end, {})
