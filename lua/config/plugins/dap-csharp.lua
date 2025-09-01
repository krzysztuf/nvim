return {
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = { ensure_installed = { "netcoredbg" } },
			},
		},
		opts = function()
			local dap = require("dap")
			if not dap.adapters.coreclr then
				dap.adapters.coreclr = {
					type = "executable",
					command = "netcoredbg",
					args = { "--interpreter=vscode" },
				}
			end
			if not dap.configurations.cs then
				dap.configurations.cs = {
					{
						type = "coreclr",
						name = "Launch - netcoredbg",
						request = "launch",
						program = function()
							return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
						end,
					},
				}
			end
		end,
	},
}