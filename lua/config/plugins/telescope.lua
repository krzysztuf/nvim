return {
  {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
	  local telescope = require('telescope')
	  local builtin = require('telescope.builtin')

	  telescope.setup({
		defaults = {
		  mappings = {
			i = {
			  ["<CR>"] = "select_default",
			},
			n = {
			  ["<CR>"] = "select_default",
			},
		  },
		},
		pickers = {
		  lsp_document_symbols = {
			fname_width = 30,        -- filename width (if shown)
			symbol_width = 50,       -- symbol names column width (default is usually 25)
			symbol_type_width = 12,  -- symbol type column width (optional)
		  },
		  lsp_workspace_symbols = {
			fname_width = 30,
			symbol_width = 50,
			symbol_type_width = 12,
		  },
		  lsp_dynamic_workspace_symbols = {
			fname_width = 30,
			symbol_width = 50,
			symbol_type_width = 12,
		  },
		}
	  })

	  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	  vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { desc = 'LSP document symbols' })
	  vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'LSP references' })
	  vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'LSP definitions' })
	  vim.keymap.set('n', '<F2>', builtin.lsp_definitions, { desc = 'LSP definitions' })
	  vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { desc = 'LSP type definitions' })
	  vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, { desc = 'LSP workspace symbols' })
	  vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'LSP diagnostics' })
	end
	-- keys = {
	--   {
	--     "<D-f>",
	--     function() require("telescope.builtin").find_files() end,
	--     desc = "Telescope find files",
	--   },
	--   {
	--     "<D-g>",
	--     function() require("telescope.builtin").live_grep() end,
	--     desc = "Telescope live grep",
	--   },
	--   {
	--     "<D-h>",
	--     function() require("telescope.builtin").help_tags() end,
	--     desc = "Telescope help tags",
	--   },
	-- },
  },
}
