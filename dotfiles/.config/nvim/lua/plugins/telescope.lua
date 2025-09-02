return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      mappings = { i = { ["<C-u>"] = false, ["<C-d>"] = false } },
    },
  },
  -- Optional turbo (uncomment if you compile it):
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function() return vim.fn.executable("make") == 1 end,
  --     config = function() pcall(require("telescope").load_extension, "fzf") end },
  -- },
}
