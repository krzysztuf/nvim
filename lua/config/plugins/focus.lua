return {
  "nvim-focus/focus.nvim",
  version = false,
  config = function()
	require("focus").setup({
	  enable = true,
	  commands = true,
	  autoresize = {
		enable = false, -- We'll handle resizing manually
		maxwidth = 120,
		minheight = 5,
		height_quickfix = 10,
	  },
	  split = {
		bufnew = false,
		tmux = false,
	  },
	  ui = {
		number = false,
		relativenumber = false,
		hybridnumber = false,
		absolutenumber_unfocussed = false,
		cursorline = true,
		cursorcolumn = false,
		colorcolumn = {
		  enable = false,
		  list = '+1',
		},
		signcolumn = true,
		winhighlight = true,
	  }
	})
	
	local function conditional_resize()
	  local total_width = vim.o.columns
	  local normal_windows = vim.tbl_filter(function(win)
		return vim.api.nvim_win_get_config(win).relative == ""
	  end, vim.api.nvim_tabpage_list_wins(0))
	  local num_windows = #normal_windows
	  
	  if num_windows <= 1 then return end
	  
	  local available_width_per_window = math.floor(total_width / num_windows)
	  
	  if available_width_per_window < 120 then
		-- Not enough space for 120 columns each - resize focused window
		local current_win = vim.api.nvim_get_current_win()
		local focused_width = math.min(120, total_width - (num_windows - 1) * 30)
		
		-- Set the focused window width
		vim.api.nvim_win_set_width(current_win, focused_width)
	  else
		-- Enough space - equalize all windows
		vim.cmd('wincmd =')
	  end
	end
	
	vim.api.nvim_create_autocmd({'WinEnter', 'VimResized'}, {
	  callback = function()
		vim.defer_fn(conditional_resize, 10)
	  end,
	  desc = "Conditionally resize windows based on available space"
	})
  end
}
