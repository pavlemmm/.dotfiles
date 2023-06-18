local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    -- Custom LSP keymaps
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
    vim.keymap.set({ "n", "x" }, "<leader>f", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

-- lsp.setup_servers({'tsserver', 'eslint'})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
    error = "",
    warn = "",
    hint = "",
    info = "",
})

local config = {
    -- disable virtual text
    virtual_text = false,

    -- show signs
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

-- local kind_icons = {
--     Text = "",
--     Method = "m",
--     Function = "",
--     Constructor = "",
--     Field = "",
--     Variable = "",
--     -- Class = "",
--     Class = "C",
--     Interface = "",
--     Module = "",
--     Property = "",
--     Unit = "",
--     Value = "",
--     Enum = "",
--     -- Keyword = "",
--     Keyword = "K",
--     Snippet = "",
--     Color = "",
--     File = "",
--     Reference = "",
--     Folder = "",
--     EnumMember = "",
--     Constant = "",
--     Struct = "",
--     Event = "",
--     Operator = "",
--     TypeParameter = "",
-- }

local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-l>"] = cmp.mapping.confirm({ select = true }),
        ["<C-h>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        -- Navigate between snippet placeholder
        ["<Tab>"] = cmp_action.luasnip_jump_forward(),
        ["<S-Tab>"] = cmp_action.luasnip_jump_backward(),
    },

    formatting = {
        -- fields = { "kind", "abbr", "menu" },
        format = require("lspkind").cmp_format({}),
    },
    sources = {
        { name = "nvim_lsp" },
        -- { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
})
