return {
  "nvim-focus/focus.nvim",
  version = false,
  config = function()
	require("focus").setup({
	  enable = true,
	  commands = true,
	  autoresize = {
		enable = true,
		minwidth = 130,    -- Minimum width of unfocused windows
		minheight = 5,    -- Minimum height of unfocused windows
		height_quickfix = 10, -- Quickfix window height
	  },
	  split = {
		bufnew = false,   -- Create blank buffer for new split windows
		tmux = false,     -- Create tmux splits instead of neovim splits
	  },
	  ui = {
		number = false,           -- Display line numbers in the focussed window only
		relativenumber = false,   -- Display relative line numbers in the focussed window only
		hybridnumber = false,     -- Display hybrid line numbers in the focussed window only
		absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows
		cursorline = true,        -- Display a cursorline in the focussed window only
		cursorcolumn = false,     -- Display cursorcolumn in the focussed window only
		colorcolumn = {
		  enable = false,       -- Display colorcolumn in the focussed window only
		  list = '+1',          -- Set the comma-separated list for the colorcolumn
		},
		signcolumn = true,        -- Display signcolumn in the focussed window only
		winhighlight = true,     -- Auto highlighting for focussed/unfocussed windows
	  }
	})
  end
}
