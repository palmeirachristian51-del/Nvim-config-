# 🚀 NeoVim Configuración personal 

**""Vim es como el jazz: parece complejo al principio, pero una vez que lo entiendes, nunca quieres volver a tocar música comercial" 🎷**  
*(Un ex-usuario de VS Code que estaba cansado del consumo de RAM*

---
## ⌨️ Keymaps Esenciales (¡Memoriza Estos!)

| Atajo         | Acción                                                  | Modo          |
|---------------|---------------------------------------------------------|---------------|
| `<Espacio><Espacio>` | Ejecuta `:source` (recarga config)                      | Normal        |
| `<Espacio>w`  | Guarda los archivos                                     | Normal        |
| `<Espacio>ff` | Buscar archivos con Telescope                           | Normal        |
| `<Espacio>f`  | Formatea el archivo                                     | Normal        |
| `Alt+d`       | Toggle NvimTree (abrir/cerrar árbol de archivos)       | Normal        |
| `Alt+e`       | Moverse entre archivos/directorios en NvimTree         | Normal        |
| `<Espacio>a`  | Agregar archivo a Harpoon                              | Normal        |
| `Ctrl+e`      | Mostrar listado de archivos en Harpoon                 | Normal        |
| `<Espacio>z`  | Toggle de bloques: `if`, `for`, funciones, etc.        | Normal        |
| `Alt+[`       | Ir al archivo anterior en Harpoon                      | Normal        |
| `Alt+]`       | Ir al archivo siguiente en Harpoon                     | Normal        |

> Nota: `<Espacio>` es tu tecla líder.

## 🔥 **Características Principales**
- **Base:** [LazyVim](https://github.com/folke/lazy.nvim)  
- **Neovim 0.11.2+** (¡Sí o sí! Para que el LSP funcione como magia negra eficiente)  
- **Optimizado para:** Python, JavaScript, Go (y otros lenguajes con poco esfuerzo)  
- **Rápido como el rayo ⚡** (Adiós tiempos de carga de 5 segundos, VS Code)

---

## 🛠️ **Instalación (Guía para Mortales)**

### 📦 **Dependencias Obligatorias**
```bash
# Instalar en Linux (Debian/Ubuntu)
sudo apt update && sudo apt install -y ripgrep fd-find python3-pip nodejs npm

# Formateadores Python (¡No los omitas!)
pip install ruff black
# Formateadores Frontend
npm install -g prettier
```

## 🎨 **Personalización** 
Para personalizar esta configuración, edita los archivos en:
```bash
~/.config/nvim/lua/config/
├── keybinds.lua      # Atajos de teclado
├── lazy.lua         # Configuración de LazyVim
└── options.lua      # Opciones de Neovim3
```
## 📜 **Licencia**
Esta configuración está bajo licencia MIT. ¡Úsala, modifícala y compártela! 🤝
