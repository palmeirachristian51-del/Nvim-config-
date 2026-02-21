return {
  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",
    lazy = false,

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
      ------------------------------------------------------------------
      -- 🔧 LISTA CENTRAL DE LINGUAGENS
      -- 👉 para adicionar syntax highlight de uma nova linguagem:
      -- 👉 basta colocar o nome aqui
      ------------------------------------------------------------------
      local languages = {
        -- Core
        "lua",
        "query",

        -- Web
        "html",
        "css",
        "javascript",
        "typescript",
        "json",

        -- Backend / Dev
        "zig",
        "python",
        "go",
        "php",
        "bash",
        "dockerfile",

        -- Config / Docs
        "yaml",
        "toml",
        "markdown",

        -- ➕ Linguagens extras
        "nim", -- 👈 suporte a Nim (syntax highlight)
      }

      ------------------------------------------------------------------
      -- 🌳 Treesitter setup
      ------------------------------------------------------------------
      require("nvim-treesitter.configs").setup({

        -- Parsers instalados automaticamente
        ensure_installed = languages,

        -- Highlight de sintaxe
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        -- Indentação baseada em AST
        indent = {
          enable = true,
          disable = { "yaml" },
        },

        -- Auto-instala parser ao abrir arquivo (opcional)
        auto_install = true,

        -- Textobjects (igual ao seu atual)
        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              -- Funções
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",

              -- Classes
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",

              -- Comentários
              ["aC"] = "@comment.outer",

              -- Parâmetros
              ["i,"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
}

