-- lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
        -- Archivos y texto
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",   desc = "Archivos recientes" },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Buscar texto (grep interactivo)"
        },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Buscar buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",    desc = "Buscar ayuda" },

        -- Git
        { "<leader>fs", "<cmd>Telescope git_files<cr>",    desc = "Buscar archivos Git" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>",   desc = "Git status" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>",  desc = "Commits del repo" },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Ramas de Git" },
    },
    config = function()

        vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1e222a' })
        vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#5d677a', bg = '#1e222a' })
        vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = '#abb2bf', bg = '#1e222a' })
        vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#5d677a', bg = '#1e222a' })
        vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#1e222a', bg = '#5d677a' })
        vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = '#1e222a', bg = '#98c379' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = '#1e222a', bg = '#61afef' })

        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "%.git/" },
                -- prompt_prefix = "🔍 ",
                -- selection_caret = "➤ ",
                sorting_strategy = "descending",
                layout_config = {
                    horizontal = { preview_width = 0.6 },
                },
                color_devicons = true,
            },
            pickers = {
                find_files = { theme = "dropdown", hidden = true },
                oldfiles = { only_cwd = true },
            },

        })
    end,
}
