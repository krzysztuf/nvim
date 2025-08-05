return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	config = function()
		require("lspconfig").clangd.setup({
			cmd = { 
				"clangd", 
				"--background-index",
				"--compile-commands-dir=.",
			},
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
		})
	end,
	keys = {
		{
			"<F1>",
			"<cmd>lua vim.diagnostic.open_float()<CR>",
			desc = "Toggle Spectre",
		},
	},
	init_options = {
		compilationDatabasePath = ".", 
	},
}
