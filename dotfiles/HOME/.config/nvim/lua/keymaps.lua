--------------------------
-- General

local keymap = vim.keymap -- for conciseness

local nvx = { "n", "v", "x" }
local n = "n"
local v = "v"

-- leader key
vim.g.mapleader = " "               -- leader to space
keymap.set(nvx, "<Space>", "<Nop>") -- disable space in n, v

--------------------------
-- Navigation

-- keymap.set(i, "jk", "<ESC>") -- use jk to exit insert mode

vim.keymap.set(nvx, "<leader>n", function() -- toggle search highlighting
  vim.o.hlsearch = not vim.o.hlsearch
end, { desc = "Toggle search highlight" })

-- keymap.set(nvx, "<leader>n", ":nohl<CR>") -- clear search highlights

--------------------------
-- Motions

-- stay in visual while doing indentation
keymap.set(v, ">", ">gv")
keymap.set(v, "<", "<gv")

-- center <C-d> <C-u> motions
keymap.set(nvx, "<C-d>", "<C-d>zz")
keymap.set(nvx, "<C-u>", "<C-u>zz")

-- map <C-j> <C-k> to <C-d> <C-u>
-- keymap.set(n, "<C-j>", "<C-d>zz")
-- keymap.set(n, "<C-k>", "<C-u>zz")

-- map g + h,j,k,l like helix
-- keymap.set(n, "gh", "_")
-- keymap.set(n, "gj", "G")
-- keymap.set(n, "gk", "gg")
-- keymap.set(n, "gl", "$")

--------------------------
-- Marks

keymap.set(nvx, "M", "`")                  -- remap M to go to mark
keymap.set(nvx, "<leader>m", ":marks<CR>") -- list marks
-- keymap.set(nvx, "<leader>m", ":marks a-zA-Z<CR>") -- list marks

--------------------------
-- Tweaks

keymap.set(nvx, "x", '"_x') -- delete characters without copying into register
keymap.set(n, "U", "<C-r>") -- map u to redo
-- keymap.set(nvx, ";", ":") -- remap ; to command mode

--------------------------
-- Clipboard

keymap.set(nvx, "<leader>p", '"+p')
keymap.set(nvx, "<leader>P", '"+P')
keymap.set(nvx, "<leader>y", '"+y')
keymap.set(nvx, "<leader>Y", '"+Y')
keymap.set(nvx, "<leader>d", '"+d')
keymap.set(nvx, "<leader>D", '"+D')
-- keymap.set(nvx, "<C-s-c>", '"+y')

--------------------------
-- Window management

keymap.set(nvx, "<leader>v", "<C-w>v") -- split window verticnvxy
keymap.set(nvx, "<leader>s", "<C-w>s") -- split window horizontnvxy

keymap.set(nvx, "<leader>L", ":vertical resize +10<CR>")
keymap.set(nvx, "<leader>H", ":vertical resize -10<CR>")
keymap.set(nvx, "<leader>K", ":resize +10<CR>")
keymap.set(nvx, "<leader>J", ":resize -10<CR>")

-- Tmux navigation
keymap.set(nvx, "<leader>h", ":TmuxNavigateLeft<CR>")
keymap.set(nvx, "<leader>j", ":TmuxNavigateDown<CR>")
keymap.set(nvx, "<leader>k", ":TmuxNavigateUp<CR>")
keymap.set(nvx, "<leader>l", ":TmuxNavigateRight<CR>")
-- keymap.set(n, "<C-h>", ":TmuxNavigateLeft<CR>")
-- keymap.set(n, "<C-j>", ":TmuxNavigateDown<CR>")
-- keymap.set(n, "<C-k>", ":TmuxNavigateUp<CR>")
-- keymap.set(n, "<C-l>", ":TmuxNavigateRight<CR>")

keymap.set(nvx, "<leader>w", ":close<CR>") -- close current window
-- keymap.set(nvx, "<leader>w", ":q!<CR>") -- close current buffer

--------------------------
-- Tabs

keymap.set(nvx, "<leader>t", ":tab split<CR>")  -- open new tab that is duplicate
-- keymap.set(n, "<leader>w", ":tabclose<CR>")  -- close current tab
keymap.set(nvx, "<leader><TAB>", ":tabn<CR>")   --  go to next tab
keymap.set(nvx, "<leader><S-TAB>", ":tabp<CR>") --  go to previous tab

-- Go to tab 1..9
for i = 1, 9 do
  keymap.set(nvx, "<leader>" .. i, i .. "gt", {
    desc = "Go to tab " .. i,
  })
end

--------------------------
-- Terminal

local t = "t"
keymap.set(t, "<Esc>", "<C-\\><C-n>") --  escape terminal

--------------------------
-- Explorer

-- keymap.set(n, "<leader>e", ":Explore<CR>") - default explorer (Netrw file explorer)

-- MiniFiles explorer
keymap.set(nvx, "<leader>e", function()
  if not MiniFiles.close() then
    MiniFiles.open()
  end
end)

--------------------------
-- CCC Color Picker

keymap.set(n, "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })
keymap.set(n, "<leader>cr", "<cmd>CccConvert<CR>", { desc = "Replace Color" })
keymap.set(n, "<leader>ct", "<cmd>CccHighlighterToggle<CR>", { desc = "Toggle color highlight" })

--------------------------
-- Fuzzy

-- MiniPick
keymap.set(nvx, "<leader>f", ":Pick files<CR>")
keymap.set(nvx, "<leader>g", ":Pick grep_live<CR>")
keymap.set(nvx, "<leader>b", ":Pick buffers<CR>")

-- keymap.set(n, "<leader>f", FzfLua.files)
-- keymap.set(n, "<leader>b", FzfLua.buffers)
-- keymap.set(n, "<leader>g", FzfLua.live_grep)
-- keymap.set(n, "<leader>m", FzfLua.marks)
-- keymap.set(n, "<leader>d", FzfLua.diagnostics_document)
-- keymap.set(n, "<leader>D", FzfLua.diagnostics_workspace)
-- keymap.set(n, "gr", FzfLua.lsp_references)
-- keymap.set(n, "gd", FzfLua.lsp_definitions)
-- keymap.set(n, "gD", FzfLua.lsp_declarations)
-- keymap.set(n, "gi", FzfLua.lsp_implementations)
-- keymap.set(n, "ga", FzfLua.lsp_code_actions)

--------------------------
-- LSP

-- Smart K for hover and diagnostics
keymap.set(n, "K", function()
  local diag = vim.diagnostic.open_float()
  if diag then
    return
  end

  vim.lsp.buf.hover()
end, { silent = true })

-- keymap.set(nvx, "<leader>f", vim.lsp.buf.format) -- formating

-- Diagnostic window
keymap.set(n, "<leader>D", vim.diagnostic.setqflist) -- Quickfix list diagnostics for whole project

-- Close quickfix window with leader+d or open loc list diagnostics
keymap.set(n, "<leader>d", function()
  local qf_win = vim.fn.getqflist({ winid = 0 }).winid
  if qf_win ~= 0 then
    vim.cmd("cclose") -- zatvori quickfix ako je otvorena
  else
    vim.diagnostic.setloclist()
  end
end, { desc = "Toggle project diagnostics" })
-- keymap.set(n, "<leader>d", vim.diagnostic.setloclist) -- local diagnostics

keymap.set(n, "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set(n, "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- not in my workflow no language supported
-- keymap.set(n, "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })  -- not in my workflow, same as gd?
-- keymap.set(n, 'gt', vim.lsp.buf.type_definition, { desc = "Show type definition" }) -- not in my workflow, strange behaviour?
keymap.set(n, "gr", vim.lsp.buf.references, { desc = "Show references" })
keymap.set(n, "ga", vim.lsp.buf.code_action, { desc = "Code action" })
keymap.set(n, "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help of a function" })
keymap.set(n, "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })

--------------------------
-- Flash

local flash = require("flash")

local nxo = { "n", "x", "o" }
local c = "c"

vim.keymap.set(nxo, ";", function()
  flash.jump()
end, { desc = "Flash jump" })

vim.keymap.set(nxo, "g;", function()
  flash.treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set(c, "<C-f>", function()
  flash.toggle()
end, { desc = "Toggle Flash Search" })

--------------------------
-- MiniJump2d

-- keymap.set(nvx, "<leader>f", MiniJump2d.start)
