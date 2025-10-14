-- Indentation settings for C/C++ headers
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.autoindent = true

-- Use cindent for C/C++ headers as it handles templates better than TreeSitter
vim.opt_local.cindent = true
vim.opt_local.smartindent = false
vim.opt_local.indentexpr = ""

-- C++ specific cindent options for better template handling
vim.opt_local.cinoptions = "g0,h1s,i4,N-s,t0,+4,(0,u0,w1,m1"