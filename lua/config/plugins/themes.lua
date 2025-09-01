return {
  {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	config = function()
	  require("nightfox").setup({
		options = {
		  transparent = false,
		  terminal_colors = true,
		}
	  })
	  vim.cmd("colorscheme nightfox")
	end
  },
  {
	"mhartington/oceanic-next",
	lazy = false,
  },
  {
	"catppuccin/nvim",
	config = function()
	  require("catppuccin").setup({
		flavour = "auto", -- latte, frappe, macchiato, mocha
		background = { -- :h background
		  light = "latte",
		  dark = "mocha",
		},
		dim_inactive = {
		  enabled = true,
		  shade = "dark",
		  percentage = 0.15,
		},
		no_italic = true,
		no_bold = true,
	  })
	  vim.cmd.colorscheme "catppuccin"
	end
  },
  {
	"Shatur/neovim-ayu",
	config = function()
	  require("ayu").setup({
		mirage = true,
	  })
	end
  },
  {
	"jsit/toast.vim",
  },
  {
	"projekt0n/github-nvim-theme",
	lazy = false,
  },
  {
	"f-person/auto-dark-mode.nvim",
	opts = {
	  update_interval = 1000,
	  set_dark_mode = function()
		vim.api.nvim_set_option_value("background", "dark", {})
		vim.cmd("colorscheme ayu")
		vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
	  end,
	  set_light_mode = function()
		vim.api.nvim_set_option_value("background", "light", {})
		vim.cmd("colorscheme toast")
		vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
		-- Fix nvim-tree floating window background in light mode
		vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
		vim.api.nvim_set_hl(0, 'NvimTreeNormalFloat', { bg = 'NONE' })
		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
	  end,
	}
  }
}
