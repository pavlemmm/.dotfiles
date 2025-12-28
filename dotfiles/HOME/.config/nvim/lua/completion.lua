require("luasnip.loaders.from_vscode").lazy_load() -- for friendly-snippets load

local blink = require("blink.cmp")

blink.setup({
  sources = {
    default = { "snippets", "lsp", "path", "buffer" },
  },

  completion = {
    menu = { border = "none" },
    documentation = { auto_show = true },
    ghost_text = {
      -- enabled = true,
      show_without_selection = true,
    },
    list = {
      selection = {
        preselect = false,
      },
    },
  },

  signature = { enabled = true },

  snippets = { preset = "luasnip" },

  fuzzy = { implementation = "lua" },

  keymap = {
    preset = "default",

    ["<CR>"] = { "accept", "fallback" },

    ["<C-j>"] = { "select_next" },
    ["<C-k>"] = { "select_prev" },
    ["<C-l>"] = { "select_and_accept" },
    ["<C-h>"] = { "cancel" },

    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },

    ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
  },
})
