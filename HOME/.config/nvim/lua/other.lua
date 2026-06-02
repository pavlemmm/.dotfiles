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

require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
  },
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
