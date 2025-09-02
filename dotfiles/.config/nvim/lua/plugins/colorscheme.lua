return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- load before all other plugins
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    term_colors = true,
    integrations = {
      treesitter = true,
      gitsigns = true,
      telescope = true,
      mini = true,
      cmp = true,
      native_lsp = {
        enabled = true,
        underlines = { errors = { "undercurl" }, hints = { "undercurl" }, warnings = { "undercurl" }, information = { "undercurl" } },
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
