require("mini.icons").setup()

require('mini.indentscope').setup({
  draw = {
    delay = 50
  }
})

require("mini.files").setup({
  mappings = {
    close = '<ESCAPE>',
  }
})

require("lualine").setup({})

require("mini.pick").setup({
  mappings = {
    choose = "<CR>",

    delete_left = "",
    delete_word = "",

    move_down = "<C-j>",
    move_up = "<C-k>",

    scroll_down = "<C-d>",
    scroll_left = "",
    scroll_right = "",
    scroll_up = "<C-u>",

    stop = "<ESCAPE>",
  },
})

require("ccc").setup({
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
})

require("mini.pairs").setup()

require("mini.surround").setup()

require("mini.starter").setup()

require("flash").setup {
  modes = {
    -- search = { enabled = true },
    char = {
      -- jump_labels = true,
      highlight = { backdrop = false },
      multi_line = false,
    }
  }
}

require("ts-comments").setup()

require("mini.bracketed").setup()

-- require("mini.jump2d").setup({
--   mappings = { start_jumping = "", },
-- })

-- require("colorizer").setup({
--   user_default_options = {
--     mode = "foreground",
--     RGB = true,      -- #RGB hex codes
--     RRGGBB = true,   -- #RRGGBB hex codes
--     names = false,   -- "Name" codes like Blue
--     RRGGBBAA = true, -- #RRGGBBAA hex codes
--     rgb_fn = true,   -- CSS rgb() and rgba() functions
--     hsl_fn = true,   -- CSS hsl() and hsla() functions
--     css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
--     css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
--   },
-- })

-- require("fzf-lua").setup({
--   diagnostics = { winopts = { preview = { layout = "vertical", }, } }, -- list levo, preview desno
--   lsp = { code_actions = { winopts = { preview = { hidden = true, }, } }, },
--   marks = { marks = "%a" },
-- })
