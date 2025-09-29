local function toggle_header_source()
    local current_file = vim.fn.expand('%:p')
    local file_ext = vim.fn.expand('%:e')
    local file_root = vim.fn.expand('%:p:r')
    local file_name = vim.fn.expand('%:t:r')
    local current_dir = vim.fn.expand('%:p:h')
    
    local target_file = nil
    local alt_target_file = nil
    
    if file_ext == 'cpp' then
        target_file = file_root .. '.h'
        alt_target_file = current_dir .. '/../include/' .. file_name .. '.h'
    elseif file_ext == 'h' then
        target_file = file_root .. '.cpp'
        alt_target_file = current_dir .. '/../src/' .. file_name .. '.cpp'
    else
        print("Not a .cpp or .h file")
        return
    end
    
    if vim.fn.filereadable(target_file) == 1 then
        vim.cmd('edit ' .. target_file)
    elseif vim.fn.filereadable(alt_target_file) == 1 then
        vim.cmd('edit ' .. alt_target_file)
    else
        print("Target file does not exist: " .. target_file .. " or " .. alt_target_file)
    end
end

-- Indentation settings for C++
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.autoindent = true

-- Use cindent for C++ as it handles templates better than TreeSitter
vim.opt_local.cindent = true
vim.opt_local.smartindent = false
vim.opt_local.indentexpr = ""

-- C++ specific cindent options for better template handling
vim.opt_local.cinoptions = "g0,h1s,i4,N-s,t0,+4,(0,u0,w1,m1"

vim.keymap.set('n', '<F4>', toggle_header_source, { desc = 'Toggle between header and source' })