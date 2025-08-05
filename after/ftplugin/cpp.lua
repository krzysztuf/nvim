local function toggle_header_source()
    local current_file = vim.fn.expand('%:p')
    local file_ext = vim.fn.expand('%:e')
    local file_root = vim.fn.expand('%:p:r')
    
    local target_file = nil
    
    if file_ext == 'cpp' then
        target_file = file_root .. '.h'
    elseif file_ext == 'h' then
        target_file = file_root .. '.cpp'
    else
        print("Not a .cpp or .h file")
        return
    end
    
    if vim.fn.filereadable(target_file) == 1 then
        vim.cmd('edit ' .. target_file)
    else
        print("Target file does not exist: " .. target_file)
    end
end

vim.keymap.set('n', '<F4>', toggle_header_source, { desc = 'Toggle between header and source' })