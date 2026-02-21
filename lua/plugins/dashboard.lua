return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    ------------------------------------------------------------------
    -- ASCII ART (HEADER)
    ------------------------------------------------------------------
    dashboard.section.header.val = {
      [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
      [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
      [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
      [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
      [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
      [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
      [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
      [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
      [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
      [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
      [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
      [[          ΠΟΣΕΙΔΟΝ Φ ΕΔΙTOP        ]],
    }

    ------------------------------------------------------------------
    -- BOTÕES
    ------------------------------------------------------------------
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Buscar arquivo", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Arquivos recentes", ":Telescope oldfiles<CR>"),
      dashboard.button("n", "  Novo arquivo", ":ene <BAR> startinsert<CR>"),
      dashboard.button("c", "  Configurações", function()
        vim.cmd("cd ~/.config/nvim")
        vim.cmd("e init.lua")
      end),
      dashboard.button("q", "  Sair", ":qa<CR>"),
    }

    ------------------------------------------------------------------
    -- FOOTER (FRASE)
    ------------------------------------------------------------------
    dashboard.section.footer.val = {
      "While any text editor can save your files, only Nvim can save your soul",
    }

    ------------------------------------------------------------------
    -- LAYOUT (ESPAÇAMENTO)
    ------------------------------------------------------------------
    dashboard.opts.layout[1].val = 6   -- espaço acima do ASCII
    dashboard.opts.layout[3].val = 9   -- espaço entre botões

    ------------------------------------------------------------------
    -- CORES / HIGHLIGHTS
    ------------------------------------------------------------------
    local bg = "#191724" -- fundo (VS Code / escuro elegante)

    -- Fundo geral (inclui dashboard)
    vim.api.nvim_set_hl(0, "Normal",      { bg = bg })
    vim.api.nvim_set_hl(0, "NormalNC",    { bg = bg })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
    vim.api.nvim_set_hl(0, "SignColumn",  { bg = bg })

    -- Alpha highlights
    vim.api.nvim_set_hl(0, "AlphaHeader", {
      fg = "#ff6ec7", -- rosa neon
      bg = bg,
      bold = true,
    })

    vim.api.nvim_set_hl(0, "AlphaButtons", {
      fg = "#8be9fd", -- azul
      bg = bg,
    })

    vim.api.nvim_set_hl(0, "AlphaFooter", {
      fg = "#6a9955", -- verde estilo VS Code
      bg = bg,
      italic = true,
    })

    ------------------------------------------------------------------
    -- FINALIZA
    ------------------------------------------------------------------
    alpha.setup(dashboard.opts)
  end,
}

