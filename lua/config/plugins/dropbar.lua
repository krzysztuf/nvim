return {
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		config = function()
			require('dropbar').setup({
				enable = function(buf, win, _)
					return not vim.api.nvim_win_get_config(win).zindex
						and vim.bo[buf].buftype == ''
						and vim.api.nvim_buf_get_name(buf) ~= ''
						and not vim.wo[win].diff
				end,
			})
		end
	},
}