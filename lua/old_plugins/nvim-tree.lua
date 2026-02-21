return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- íconos bonitos
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
                preserve_window_proportions = true,
            },
            renderer = {
                highlight_git = true,
                icons = {
                    git_placement = "after",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs ={
                        git = {
                            unstaged = "󰺁",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            git = {
                enable = true,
            },
        })

        -- Keymaps mejoradas
        local api = require("nvim-tree.api")
        -- Keymap para alternar el explorador
        vim.keymap.set("n", "<A-s>", api.tree.toggle, { desc = "Alternar barra de archivos" })
        -- Keymap para ver ayuda
        vim.keymap.set("n", "<A-e>", api.tree.focus, { desc = "Ir al arbol de directorios" })
    end,
}
