require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "python",
    "typescript",
    "tsx",
    "javascript",
    "html",
    "css",
    "json",
    "bash",
    "vim",
    "vimdoc",
  },

  highlight = {
    enable = true,
  },

  indent = { -- indent with =
    enable = true,
  },

  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "gi",
  --     node_incremental = "gi",
  --     -- scope_incremental = "grc",
  --     node_decremental = "gI",
  --   },
  -- }
})
