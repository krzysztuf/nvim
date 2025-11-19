return {
    { 
	'ojroques/vim-oscyank', 
	branch = 'main', 
	config = function()
	    vim.keymap.set("n", "<Leader>y", ":OSCYank<CR>")
	    vim.keymap.set("v", "<Leader>y", ":OSCYankVisual<CR>")
	end
    }
}
