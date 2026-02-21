--INTERFAZ VISUAL

vim.opt.number = true           -- Muestra números de línea
vim.opt.relativenumber = true    -- Números relativos (útil para saltos)
vim.opt.cursorline = true       -- Resalta la línea actual
vim.opt.splitright = true       -- Split vertical se abre a la derecha
vim.opt.wrap = false            -- Si la linea es muy larga se desplaza horizontalmente
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

--INDENTACIÓN Y TABS
vim.opt.shiftwidth = 4          -- Espacios para indentación
vim.opt.tabstop = 4             -- Espacios por tab
vim.opt.softtabstop = 4         -- Espacios para tabs en modo inserción
vim.opt.expandtab = true        -- Convierte tabs a espacios

--COMPORTAMIENTO DEL CURSOR
vim.opt.mouse = ""             -- Soporte para mouse en todos los modos
--vim.opt.mousescroll = "ver:0,hor:0" 
--GESTION ARCHIVOS 
vim.opt.swapfile = false       -- desactiva los archivos .swp (intercambio temporal).
vim.opt.backup = false         -- no crea archivos de respaldo.

