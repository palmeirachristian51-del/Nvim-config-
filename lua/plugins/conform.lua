return {
    "stevearc/conform.nvim",
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua", lsp_format = "fallback" },
            python = { "ruff", "black" },
            go = { "goimports", "gofmt" },
             -- Web technologies
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
             -- PHP/Laravel
            php = { "pint" },
            -- Shell
            sh = { "shfmt" },
            bash = { "shfmt" },
        },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
