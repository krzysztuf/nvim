require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true })

local function make_transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    
    -- Configure hover popup to be visible
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#89b4fa" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = make_transparent
})

-- Set global floating window defaults
vim.o.winblend = 0

-- Ensure hover popup is always visible after any colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2a2a2a", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#2a2a2a", fg = "#6495ed" })
    end
})

-- Configure diagnostics with borders
vim.diagnostic.config({
    float = {
        border = "rounded",
        source = "always",
    },
})

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap('n', '<M-Tab>', '<C-w>w', default_opts)
keymap('n', '<M-S-Tab>', '<C-w>W', default_opts)


