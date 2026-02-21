-- Configuración del líder
vim.g.mapleader = ' ' -- Usa Espacio como líder
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opts = { noremap = true, silent = true } -- Evita recursividad y mensajes no deseados SALIR DE TODO
--CERRAR TODO
vim.keymap.set("n", "<leader>cc", function()
    local function show_error()
        vim.notify("⚠️ Não é possível sair. Há alterações não salvas nos buffers:\n" ..
            "• Use ':wa' para salvar tudo e depois ':qa'\n" ..
            "• Use ':qa!' para descartar todas as alterações",
            vim.log.levels.ERROR, {
                title = "Ação necessária",
                timeout = 5000,
                icon = "",
                on_open = function(win)
                    local buf = vim.api.nvim_win_get_buf(win)
                    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
                end,
            })
    end

    -- Intenta salir silenciosamente para validar
    local success, err = pcall(vim.cmd, "qa")

    if not success then
        -- Analiza el mensaje de error para determinar la causa
        if string.find(err, "E37") then -- Código de error para buffers no guardados
            show_error()
        else
            -- Para otros tipos de errores
            vim.notify("❌ Erro ao tentar sair: " .. err, vim.log.levels.ERROR)
        end
    end
end, opts, { desc = "Sair do nvim" })


--GUARDAR ARCHIVO RÁPIDO
vim.keymap.set('n', '<leader>w', function()
    print("Salvando arquivo...")
    vim.cmd.w()
    print("Salvo!")
end, opts, { desc = "Guardar alterações" })
-- Atajo: Espacio + w
vim.keymap.set("n", "n", "nzzzv", { desc = "buscar proximo y centrar" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "buscar anterior y centrar" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Media página abajo + centrar" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Media página arriba + centrar" })

--COPIAR/PEGAR AL PORTAPAPELES DEL SISTEMA
vim.keymap.set('v', '<leader>y', '"+y', opts, { desc = "Copiar al portapapeles" }) -- Copiar selección
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Pegar sobre texto sin afectar registros" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Eliminar lineas sin afectar lo copiado " })
-- CRTL + x PARA CORTAR
vim.keymap.set("n", "<C-x>", "dd", opts, { desc = "Cortar" })
-- SELECCIONAR TODO
vim.keymap.set("n", "<A-a>", "ggVG", opts) -- Alternar entre inicio (0) y final ($) de línea con la misma tecla (ej. <A-l>)
-- IR AL INICIO O FIN DE LA LINEA DINAMICAMENTE
vim.keymap.set('n', '<A-w>', function()
    local first_char = vim.fn.col('.') == 1 -- ¿Estás en la columna 1?
    if first_char then
        vim.cmd('normal! $')                -- Si ya estás al inicio, ve al final
    else
        vim.cmd('normal! 0')                -- Si no, ve al inicio
    end
end, { desc = 'Toggle inicio y fin de la linea' })

-- Versión para modo visual (selección)
vim.keymap.set('v', '<A-w>', function()
    local first_char = vim.fn.col('.') == 1
    if first_char then
        vim.cmd('normal! $')
    else
        vim.cmd('normal! 0')
    end
end, { desc = 'Visual inicio y fin de la linea' })

--MOVER ARRIBA O ABAJO LAS LINEAS
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--KEY PARA ESC
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jj", "<ESC>", { noremap = false })
vim.keymap.set("i", "jk", "<ESC>", { noremap = false })

vim.keymap.set("n", "<leader><leader>", function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local ext = buf_name:match("^.+(%..+)$") or ""

    local valid_exts = { ".vim", ".vimrc", ".lua" }

    local can_source = false
    for _, v in ipairs(valid_exts) do
        if ext == v then
            can_source = true
            break
        end
    end

    if can_source then
        vim.cmd("so")
        print("Source ejecutado correctamente.")
    end
end, { desc = "Source solo archivos compatibles" })
--REEMPLAZO INTELIGENTE
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc="Reemplazo inteligente"})
-- UNE LA LINEA SIGUIENTE A LA ANTERIOR
vim.keymap.set("n", "J", "mzJz", { desc = "Unir la currentLine con la sgte" })
-- IDENTACION SIMPLE
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Identacion simple" })
--INDENTACION MEJORADA
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
--plugin undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toogle undotree" })
--OIL explorer
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Abrir Explorador" })
vim.keymap.set('n', '<leader>nd', function()
  require('noice').cmd('dismiss')  -- Cierra solo popups/notificaciones
end, { desc = 'Cerrar notificaciones' })


-- Executar o arquivo atual com <Space>q
vim.keymap.set("n", "<leader>q", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local cmd = nil

  if ft == "lua" then
    cmd = { "lua", file }

  elseif ft == "python" then
    cmd = { "python", file }

  elseif ft == "javascript" then
    cmd = { "node", file }

  elseif ft == "nim" then
    cmd = { "nim", "c", "-r", file }

  elseif ft == "typescript" then
    cmd = { "ts-node", file }

  elseif ft == "c" then
    cmd = { "clang", file, "-o", "/tmp/a.out", "&&", "/tmp/a.out" }

  elseif ft == "cpp" then
    cmd = { "clang++", file, "-o", "/tmp/a.out", "&&", "/tmp/a.out" }

  elseif ft == "rust" then
    if vim.fn.filereadable("Cargo.toml") == 1 then
      cmd = { "cargo", "run" }
    else
      cmd = { "rustc", file, "-o", "/tmp/a.out", "&&", "/tmp/a.out" }
    end
    
  elseif ft == "zig" then
    if vim.fn.filereadable("build.zig") == 1 then
      cmd = { "zig", "build", "run" }
    else
      cmd = { "zig", "run", file }
    end


  elseif ft == "cs" then
    local csproj = vim.fn.glob("*.csproj")
    if csproj ~= "" then
      cmd = { "dotnet", "run", "--project", csproj }
    else
      print("❌ Nenhum .csproj encontrado (C# precisa de projeto)")
      return
    end

  elseif ft == "java" then
    -- ☕ Java inteligente
    if vim.fn.filereadable("pom.xml") == 1 then
      cmd = { "mvn", "exec:java" }

    elseif vim.fn.filereadable("build.gradle") == 1
        or vim.fn.filereadable("build.gradle.kts") == 1 then
      cmd = { "gradle", "run" }

    else
      local classname = vim.fn.expand("%:t:r")
      cmd = {
        "javac", file,
        "&&",
        "java", "-cp", vim.fn.expand("%:p:h"), classname
      }
    end

  elseif ft == "pascal" or ft == "fpc" then
    cmd = { "fpc", file, "-o/tmp/a.out", "&&", "/tmp/a.out" }

  else
    print("Execução não configurada para: " .. ft)
    return
  end

  vim.cmd("split | terminal")
  vim.fn.chansend(vim.b.terminal_job_id, table.concat(cmd, " ") .. "\n")
end, { desc = "Executar arquivo/projeto" })

