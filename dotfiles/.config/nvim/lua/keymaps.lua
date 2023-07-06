-- set leader key to space
--
local keymap = vim.keymap -- for conciseness

keymap.set({"n", "v"}, "<Space>", "<Nop>")
vim.g.mapleader = " "


-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>n", ":nohl<CR>")

-- delete characters without copying into register
-- keymap.set("n", "x", '"_x')

-- Copy, paste, cut on clipboard
keymap.set({ "n", "x" }, "<leader>p", '"+p')
keymap.set({ "n", "x" }, "<leader>P", '"+P')
keymap.set({ "n", "x" }, "<leader>y", '"+y')
keymap.set({ "n", "x" }, "<leader>Y", '"+Y')
keymap.set({ "n", "x" }, "<leader>d", '"+d')
keymap.set({ "n", "x" }, "<leader>D", '"+D')
keymap.set({ "n", "x" }, "<leader>c", '"+c')
keymap.set({ "n", "x" }, "<leader>C", '"+C')

-- keymap.set("x", "<leader>p", '"_dp')
-- keymap.set("n", "<leader>d", '"_d')
-- keymap.set("x", "<leader>d", '"_d')
-- keymap.set("n", "<leader>c", '"_c')
-- keymap.set("x", "<leader>c", '"_c')

-- Motion remaps
keymap.set({ "n", "v" }, "-", "_")


keymap.set({ "n", "v" }, "<C-j>", "10j")
keymap.set({ "n", "v" }, "<C-k>", "10k")

-- keymap.set("n", "<C-j>", "<C-d>zz")
-- keymap.set("n", "<C-k>", "<C-u>zz")
-- keymap.set("n", "<C-j>", "<C-d>zb")
-- keymap.set("n", "<C-k>", "<C-u>zt")


-- Redo with Shift+u
keymap.set("n", "<S-u>", "<C-r>")

-- Indentation
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
-- keymap.set("n", ">", ">>")
-- keymap.set("n", "<", "<<")

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>sw", ":close<CR>") -- close current split window

keymap.set("n", "L", ":vertical resize +10<CR>")
keymap.set("n", "H", ":vertical resize -10<CR>")
keymap.set("n", "<leader><S-k>", ":resize +10<CR>")
keymap.set("n", "<leader><S-j>", ":resize -10<CR>")

keymap.set("n", "<leader>l", "<C-w>l")
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")

-- Tabs
keymap.set("n", "<leader>t", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>w", ":tabclose<CR>") -- close current tab
keymap.set("n", "<TAB>", ":tabn<CR>")         --  go to next tab
keymap.set("n", "<S-TAB>", ":tabp<CR>")       --  go to previous tab

-- Terminal
keymap.set("t", "<Esc>", "<C-\\><C-n>")       --  escape terminal
