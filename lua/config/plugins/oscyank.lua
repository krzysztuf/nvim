return {
    { 
	'ojroques/vim-oscyank', 
	branch = 'main', 
	config = function()
	    vim.keymap.set({"n","v"}, "<Leader>y", ":OSCYank<CR>")
	end
    }
}
