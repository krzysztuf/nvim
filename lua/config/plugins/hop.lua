return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			search = {
				multi_window = true,
				incremental = true,
			},
		},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "<leader>hw", function() require("flash").jump() end, desc = "Flash jump" },
			{ "<leader>hl", function() require("flash").jump({ pattern = "^" }) end, desc = "Flash to line start" },
			{ "f", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^" }) end, desc = "Flash forward in line" },
			{ "F", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { mode = "search", max_length = 0, forward = false }, label = { after = { 0, 0 } }, pattern = "^" }) end, desc = "Flash backward in line" },
		},
	},
}
