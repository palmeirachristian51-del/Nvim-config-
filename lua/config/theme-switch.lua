local M = {}

-- Lista de temas em ordem de alternância
M.themes = { "rose-pine", "vaporlush", "green" }

function M.toggle()
    local current = vim.g.colors_name

    local next_index = 1
    for i, name in ipairs(M.themes) do
        if current == name then
            next_index = i % #M.themes + 1
            break
        end
    end

    local next_theme = M.themes[next_index]
    vim.cmd.colorscheme(next_theme)
    print("Tema atual: " .. next_theme)
end

return M
