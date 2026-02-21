return {
    -- Identacion php embed HTML 
    {
        "captbaritone/better-indent-support-for-php-with-html",
    },
    -- Marks
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- TODO: tienes que hacer tal cosa
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        opts = {
            position = "bottom",
            icons = true,
            use_diagnostic_signs = true,
        },
        keys = {
            { "<leader>tt", "<cmd>TroubleToggle<CR>", desc = "Abrir/cerrar Trouble" },
        }
    },
    --Contraer y extender lineas para mejor visualizacion
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async'
        },
        opts = {
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end
        },
        config = function(_, opts)
            -- Configuración necesaria para folding
            vim.o.foldcolumn = '0' -- '0' para ocultar la columna de fold
            vim.o.foldlevel = 99   -- niveles altos para no plegar por defecto
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            require('ufo').setup(opts)

            -- Keymap para alternar el fold bajo el cursor
            vim.keymap.set('n', '<leader>z', 'za', { silent = true, noremap = true, desc = "Toggle fold" })
        end
    },
    --Colores para indificar el cierre facilmente de ([{}])
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("rainbow-delimiters.setup")()
        end,
    },
    -- Neovim notifications and LSP progress messages
    {
        "j-hui/fidget.nvim",
    },
    {
        "nvchad/showkeys",
        cmd = "ShowkeysToggle",
        opts = {
            timeout = 1,
            maxkeys = 6,
            -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
            position = "bottom-right",
        },

        keys = {
            {
                "<A-u>",
                function()
                    vim.cmd("ShowkeysToggle")
                end,
                desc = "Show key presses",
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        config = function()
            require("ibl").setup()
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
        end,
    },
    { "lukas-reineke/virt-column.nvim", opts = { virtcolumn = "80" } },
    {
        "mbbill/undotree",
        config = function()
            vim.g.undotree_WindowLayout = 3 -- Estilo 3 (a la derecha)
        end
    },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    { "tpope/vim-fugitive" },
    -- " Básicos:
    -- :Gstatus          " Muestra cambios (staging, unstaged)
    -- :Gwrite           " Añade archivo al staging (git add)
    -- :Gread            " Descarta cambios (git checkout --)
    -- :Gcommit          " Abre editor para commit
    --
    -- " Diferencias:
    -- :Gdiffsplit       " Diff vertical contra HEAD
    -- :Gvdiffsplit      " Diff horizontal
    -- :Gdiffsplit <commit>  " Diff contra un commit específico
    --
    -- " Historial:
    -- :Gblame           " Muestra quién modificó cada línea (modo interactivo)
    -- :Glog             " Historial de commits del archivo actual
    --
    -- " Ramas y remotos:
    -- :Gbrowse          " Abre en GitHub/GitLab (requiere navegador)
    -- :Gmerge           " Fusiona ramas
    -- :Gpull            " Pull desde remoto
    -- :Gpush            " Push a remoto
}
