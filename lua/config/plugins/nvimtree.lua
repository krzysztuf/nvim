return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
			view = {
				-- Float window config
				float = {
					enable = true,
					open_win_config = {
						-- relative to the whole editor
						relative = "editor",
						-- size: 50% of width, 80% of height
						width = math.floor(vim.o.columns * 0.5),
						height = math.floor(vim.o.lines * 0.8),
						-- center it
						row = math.floor((vim.o.lines - math.floor(vim.o.lines * 0.8)) / 2),
						col = math.floor((vim.o.columns - math.floor(vim.o.columns * 0.5)) / 2),
						border = "single",  -- or "double", "rounded", etc.
					},
				},
				-- you can still set a default width if float ever disabled
				width = 30,
				side = "left",
			},

			-- auto-close if opening a file
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		}
		local opts = { noremap = true, silent = true }
		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<leader>tt", function() api.tree.toggle() end, opts)
		vim.keymap.set("n", "<Esc>", function() api.tree.close() end, opts)
		vim.keymap.set("n", "<leader>tf", function() api.tree.toggle({
			find_file = true	
		}) end, opts)
	end,
}
