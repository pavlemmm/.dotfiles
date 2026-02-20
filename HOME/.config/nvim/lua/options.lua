local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative number is on)
-- opt.colorcolumn = "80"    -- shows column at 80 characters

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = false  -- turn off highlighting after searching
opt.incsearch = true  -- highlight as you search

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true     -- split vertical window to the right
opt.splitbelow = true     -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

opt.timeoutlen = 600      -- wait beetween key combinations, default 1000
opt.updatetime = 50

opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.scrolloff = 8

-- disable INSERT text
opt.showmode = false

opt.winborder = "rounded" -- rounded borders on floating windows

-- folding
opt.foldlevelstart = 99 -- all folds are open on start

-- treesitter folding
vim.wo.foldmethod = "expr"                          -- expression folding instead of manual
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- treesitter folding expression

-- inlay hints
vim.lsp.inlay_hint.enable(true)
