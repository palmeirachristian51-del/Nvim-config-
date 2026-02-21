return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()

            -- ========================================
            -- 🅰️ FONTE (GUI only)
            -- ========================================
            -- vim.o.guifont = "JetBrainsMono Nerd Font:h12"

            -- ========================================
            -- 🌲 ROSE-PINE SETUP
            -- ========================================
            require("rose-pine").setup({
                variant = "auto",
                dark_variant = "main",
                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },
            })

            vim.cmd.colorscheme("rose-pine")

            -- ========================================
            -- 🚨 AQUI ESTÁ A MÁGICA
            -- Aplica suas cores DEPOIS do tema
            -- ========================================

            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()

                    -- ================================
                    -- 🎨 FUNDO
                    -- ================================
                    local bg_main = "#1e1e1e"

                    vim.api.nvim_set_hl(0, "Normal", { bg = bg_main })
                    vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_main })
                    vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_main })
                    vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg_main })
                    vim.api.nvim_set_hl(0, "StatusLine", { bg = bg_main })

                    -- ================================
                    -- 💬 COMENTÁRIOS
                    -- ================================
                    local comment_green = "#6a9955"

                    vim.api.nvim_set_hl(0, "Comment", { fg = comment_green, italic = true })
                    vim.api.nvim_set_hl(0, "@comment", { fg = comment_green, italic = true })
                    vim.api.nvim_set_hl(0, "SpecialComment", { fg = comment_green, italic = true })

                    -- ================================
                    -- 🔤 STRINGS
                    -- ================================
                    local string_soft = "#bd8672"

                    vim.api.nvim_set_hl(0, "String", { fg = string_soft })
                    vim.api.nvim_set_hl(0, "@string", { fg = string_soft })
                    vim.api.nvim_set_hl(0, "@string.escape", { fg = string_soft })

                    -- ================================
                    -- 🔎 VISUAL E BUSCA
                    -- ================================
                    vim.api.nvim_set_hl(0, "Visual", { bg = "#3e3a4f" })
                    vim.api.nvim_set_hl(0, "Search", { fg = "#191724", bg = "#524f67" })
                    vim.api.nvim_set_hl(0, "IncSearch", { fg = "#191724", bg = "#f6c177" })
                    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2837" })

                    -- ================================
                    -- ✨ EXTRAS
                    -- ================================
                    vim.api.nvim_set_hl(0, "MatchParen", {
                        fg = "#f6c177",
                        bg = "#3e3a4f",
                        bold = true,
                    })

                    vim.api.nvim_set_hl(0, "PmenuSel", {
                        fg = "#191724",
                        bg = "#9ccfd8",
                    })
                end,
            })

        end
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },
}

