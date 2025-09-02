-- set leader key to space
--

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set({"n", "v"}, "<Space>", "<Nop>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>n", ":nohl<CR>")

-- delete characters without copying into register
keymap.set("n", "x", '"_x')


-- enable commenting
--keymap.set("n", "gc", require("vim.comment").operator, { expr = true, desc = "Toggle comment" })
--keymap.set("x", "gc", require("vim.comment").operator, { expr = true, desc = "Toggle comment" })

-- Copy, paste, cut on clipboard
-- keymap.set({ "n", "v" }, "<leader>p", '"+p')
-- keymap.set({ "n", "v" }, "<leader>P", '"+P')
-- keymap.set({ "n", "v" }, "<leader>y", '"+y')
-- keymap.set({ "n", "v" }, "<leader>Y", '"+Y')
-- keymap.set({ "n", "v" }, "<leader>d", '"+d')
-- keymap.set({ "n", "v" }, "<leader>D", '"+D')
-- keymap.set({ "n", "v" }, "<leader>c", '"+c')
-- keymap.set({ "n", "v" }, "<leader>C", '"+C')

-- keymap.set("x", "<leader>p", '"_dp')
-- keymap.set("n", "<leader>d", '"_d')
-- keymap.set("x", "<leader>d", '"_d')
-- keymap.set("n", "<leader>c", '"_c')
-- keymap.set("x", "<leader>c", '"_c')

-- Motion remaps
keymap.set({ "n", "v" }, "<C-j>", "10j")
keymap.set({ "n", "v" }, "<C-k>", "10k")


-- Indentation
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>sw", ":close<CR>") -- close current split window

keymap.set("n", "L", ":vertical resize +10<CR>")
keymap.set("n", "H", ":vertical resize -10<CR>")
keymap.set("n", "<leader>K", ":resize +5<CR>")
keymap.set("n", "<leader>J", ":resize -5<CR>")

keymap.set("n", "<leader>l", "<C-w>l")
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")

-- Tabs
keymap.set("n", "<leader>t", ":tab split<CR>")   -- open new tab that is duplicate
-- keymap.set("n", "<leader>t", ":tabnew %<CR>")   -- open new tab that is duplicate
keymap.set("n", "<leader>w", ":tabclose<CR>") -- close current tab
keymap.set("n", "<TAB>", ":tabn<CR>")         --  go to next tab
keymap.set("n", "<S-TAB>", ":tabp<CR>")       --  go to previous tab

-- Terminal
keymap.set("t", "<Esc>", "<C-\\><C-n>")       --  escape terminal
keymap.set("t", "jk", "<C-\\><C-n>")          --  escape terminal

-- Explorer
--keymap.set("n", "<leader>e", ":Explore<CR>")


-- PLUGINS --

-- files (mini.files)
keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "Explorer" })

-- telescope
keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end,  { desc = "Live grep" })
keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end,    { desc = "Buffers" })
keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Help" })

-- LSP (also set per-buffer in on_attach)
keymap.set("n", "gd", vim.lsp.buf.definition)
keymap.set("n", "gr", vim.lsp.buf.references)
keymap.set("n", "gD", vim.lsp.buf.declaration)
keymap.set("n", "gi", vim.lsp.buf.implementation)
keymap.set("n", "K",  vim.lsp.buf.hover)
keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
keymap.set("n", "[d", vim.diagnostic.goto_prev)
keymap.set("n", "]d", vim.diagnostic.goto_next)
keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
