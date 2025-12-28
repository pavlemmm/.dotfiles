-- -- Transparent if colorscheme configuration doesnt have
-- local hl = vim.api.nvim_set_hl
-- hl(0, "Normal", { bg = "none" })
-- hl(0, "NormalNC", { bg = "none" })
-- hl(0, "SignColumn", { bg = "none" })
-- hl(0, "VertSplit", { bg = "none" })
-- hl(0, "NormalFloat", { bg = "none" })
-- hl(0, "FloatBorder", { bg = "none" })

require("tokyonight").setup({
  style = "night",
  -- transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
  -- lualine_bold = true,
})

require("github-theme").setup({
  options = {
    -- transparent = true,
  }
})

require("catppuccin").setup({
  flavour = "mocha",
  -- transparent_background = true,
  -- float = {
  --     transparent = true,
  -- },
  term_colors = true,
})

require("rose-pine").setup({
  styles = {
    -- transparency = true,
  },
})

-- Set theme

vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme habamax")
