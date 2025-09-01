return {
    {
	'numToStr/Comment.nvim',
	config = function()
	    require('Comment').setup({
		padding = false,
		mappings = {
		    basic = true,
		    extra = true,
		}
	    })
	end
    }
}
