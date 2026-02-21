return {
  -- mini.tabline: barra de pestañas minimalista
  -- {
  --   "echasnovski/mini.tabline",
  --   version = false,
  --   config = function()
  --     require("mini.tabline").setup()
  --   end,
  -- },
  --
  -- mini.cursorword: resalta otras ocurrencias de la palabra bajo el cursor
  {
    "echasnovski/mini.cursorword",
    version = false,
    config = function()
      require("mini.cursorword").setup()
    end,
  },

  -- mini.splitjoin: convierte entre una línea y múltiples líneas estructuras de código
  {
    "echasnovski/mini.splitjoin",
    version = false,
    config = function()
      require("mini.splitjoin").setup()
    end,
  },

  -- mini.pairs: inserción automática de paréntesis, llaves, comillas, etc.
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
}

