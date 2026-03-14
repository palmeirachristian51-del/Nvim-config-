return {
    -- ROSE-PINE
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                dark_variant = "moon",
                styles = { bold = true, italic = true, transparency = false },
            })
            vim.cmd.colorscheme("rose-pine")
        end,
    },

    -- LUSH (dependência do vaporlush)
    { "rktjmp/lush.nvim", lazy = true },

    -- VAPORLUSH
    {
        "adamkali/vaporlush",
        name = "vaporlush",
        lazy = true,
        priority = 900,
        dependencies = { "rktjmp/lush.nvim" },
    },

    -- GREEN (vim-colors-green)
    {
        "julien/vim-colors-green",
        name = "vim-colors-green",
        lazy = true,
        priority = 850,
    },

    -- ÍCONES
    { "nvim-tree/nvim-web-devicons", lazy = true },
}
