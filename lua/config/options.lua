-- Configuración de colores y visualización
vim.opt.termguicolors = true  -- Habilita colores true color en terminal
vim.opt.nu = true             -- Muestra números de línea
vim.opt.relativenumber = true -- Números de línea relativos
vim.opt.winborder = "rounded" -- Rounded borders
vim.opt.background = "dark"

-- Hacer el fondo transparente
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

-- Asegurarse de que la transparencia se mantiene después de cambiar colorschemes
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    end,
})


-- Configuración de plegado (folding)
vim.opt.foldmethod = "indent" -- Plegar basado en indentación
vim.opt.foldlevel = 99        -- Nivel inicial de plegado (todo desplegado)
vim.opt.clipboard = "unnamedplus"

-- Configuración de la barra de estado
vim.opt.laststatus = 2  -- Siempre muestra la barra de estado
vim.opt.showmode = false -- Muestra el modo actual (INSERT, VISUAL, etc.)

-- Configuración de indentación
vim.opt.conceallevel = 0   -- No ocultar caracteres
vim.opt.tabstop = 4        -- Tabulación = 4 espacios
vim.opt.softtabstop = 4    -- Espacios insertados al tabular
vim.opt.shiftwidth = 4     -- Espacios para autoindentación
vim.opt.expandtab = true   -- Convierte tabs en espacios
vim.opt.smartindent = true -- Indentación inteligente

-- Configuración de ventanas y visualización
vim.opt.splitright = true -- Nuevas ventanas se abren a la derecha
vim.opt.wrap = false      -- No envolver líneas largas

-- Configuración de archivos temporales
vim.opt.swapfile = false -- Desactiva archivos swap
vim.opt.backup = false   -- Desactiva copias de seguridad
vim.opt.undofile = true  -- Habilita historial persistente
vim.opt.undodir = ...    -- Directorio para archivos de deshacer

-- Configuración de búsqueda
vim.opt.ignorecase = true -- Búsquedas no distinguen mayúsculas
vim.opt.hlsearch = true   -- Resalta resultados de búsqueda
vim.opt.incsearch = true  -- Búsqueda incremental

-- Otros ajustes
vim.opt.scrolloff = 8             -- Mantiene 8 líneas visibles al desplazarse
vim.opt.signcolumn = "yes"        -- Muestra columna de signos
vim.opt.updatetime = 50           -- Actualización más rápida
