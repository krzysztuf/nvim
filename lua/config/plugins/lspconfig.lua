return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				vim.list_extend(opts.ensure_installed, { "omnisharp", "pyright" })
			end,
		},
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("lspconfig").clangd.setup({
			cmd = { 
				"clangd", 
				"--background-index",
				"--compile-commands-dir=.",
				"-j=8",
				"--pch-storage=memory",
				--"--limit-references=400",
			},
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
			init_options = {
				compilationDatabasePath = ".",
				fallbackFlags = {
					"-IC:/Users/krzys/projects/esigma/libs/3rd_party_3.3.0/Fluid-2.0.0/include",
					"-IC:/Users/krzys/projects/esigma/libs/ESDK_3.3.2/include", 
					"-IC:/Users/krzys/projects/esigma/libs/GUISDK_3.3.2/include",
					"-std=c++20",
				}
			},
		})

		local mason_registry = require("mason-registry")
		if mason_registry.is_installed("omnisharp") then
			require("lspconfig").omnisharp.setup({
				cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
				filetypes = { "cs", "vb" },
				root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json"),
				on_attach = function(client, bufnr)
					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end

		if mason_registry.is_installed("pyright") then
			require("lspconfig").pyright.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					python = {
						analysis = {
							diagnosticSeverityOverrides = {
								reportLineTooLong = "none",
							},
						},
					},
				},
			})
		end
	end,
	keys = {
		{
			"<C-k>",
			function() vim.lsp.buf.signature_help() end,
			mode = "i",
			desc = "Signature help",
		},
		{
			"<F1>",
			function() require("hover").hover() end,
			desc = "hover.nvim",
		},
		{
			"ca",
			function() vim.lsp.buf.code_action() end,
			desc = "Toggle Spectre",
		},
		{
			"<S-F1>",
			"<cmd>lua vim.diagnostic.open_float()<CR>",
			desc = "Toggle Spectre",
		},
		{
			"g]",
			"<cmd>lua vim.diagnostic.goto_next()<CR>",
			desc = "Toggle Spectre",
		},
		{
			"g[",
			"<cmd>lua vim.diagnostic.goto_prev()<CR>",
			desc = "Toggle Spectre",
		},
	},
}
