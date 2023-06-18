local dap = require("dap")

dap.configurations.python = {
    type = "executable",
    command = os.getenv("HOME") .. "/.virtualenvs/tools/bin/python",
    args = { "-m", "debugpy.adapter" },
}

local keymap = vim.keymap

keymap.set("n", "<leader>qd", dap.toggle_breakpoint)
keymap.set("n", "<leader>qc", dap.continue)
