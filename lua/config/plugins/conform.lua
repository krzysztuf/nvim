return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			cs = { "csharpier" },
			dart = { "dart_format_120" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			["clang-format"] = {
				prepend_args = { "-style=file" },
			},
			dart_format_120 = {
				command = "dart",
				args = { "format", "--page-width", "120", "$FILENAME" },
				stdin = false,
			},
		},
	},
	init = function()
		-- Only set formatexpr for specific filetypes to avoid conflicts with indentation
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "c", "cpp", "h", "hpp", "cs", "dart" },
			callback = function()
				vim.bo.formatexpr = "v:lua.require'conform'.formatexpr()"
			end,
		})
	end,
}