return {
  -- File explorer
  {
    "echasnovski/mini.files",
    version = "*",
    keys = {
      { "<leader>e", function() require("mini.files").open() end, desc = "Explorer" },
    },
    config = function() require("mini.files").setup() end,
  },

  -- Surroundings
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function() require("mini.surround").setup() end,
  },

  -- Auto pairs
  {
    "echasnovski/mini.pairs",
    version = "*",
    event = "InsertEnter",
    config = function() require("mini.pairs").setup() end,
  },

  -- Commenting
  {
    "echasnovski/mini.comment",
    version = "*",
    event = "VeryLazy",
    config = function() require("mini.comment").setup() end,
  },

  -- Statusline
  {
    "echasnovski/mini.statusline",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.statusline").setup({ use_icons = true })
    end,
  },

  -- Trailing whitespace
  {
    "echasnovski/mini.trailspace",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.trailspace").setup()
      -- auto-trim on save (optional, remove if you want manual)
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function() require("mini.trailspace").trim() end,
      })
    end,
  },

  -- Indent guides
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "BufReadPre",
    config = function()
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
      })
    end,
  },

  -- Greeter / start screen
  {
    "echasnovski/mini.starter",
    version = "*",
    config = function()
      local starter = require("mini.starter")
      starter.setup({
        autoopen = true,
        evaluate_single = true,
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(10, true),
          starter.sections.sessions(5, true),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning("center", "center"),
        },
        header = table.concat({
          "   PavleM NVIM IDE (:",
          "",
        }, "\n"),
      })
    end,
  },
}
