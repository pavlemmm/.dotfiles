local dap = require("dap")
local dapui = require("dapui")
require('dap-python').setup()

dapui.setup()

local keymap = vim.keymap

keymap.set("n", "<leader>qd", dap.toggle_breakpoint)
keymap.set("n", "<leader>qc", dap.continue)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

