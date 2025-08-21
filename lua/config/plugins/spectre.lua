return {
  {
    "nvim-pack/nvim-spectre",
    cmd = { "Spectre", "SpectreVword", "SpectreFile" },
    keys = {
      {
        "<leader>S",
        function() require("spectre").toggle() end,
        desc = "Toggle Spectre",
      },
      {
        "<leader>sw",
        function() require("spectre").open_visual({ select_word = true }) end,
        mode = "n",
        desc = "Search current word",
      },
      {
        "<leader>sw",
        function() require("spectre").open_visual() end,
        mode = "v",
        desc = "Search visual selection",
      },
      {
        "<leader>sp",
        function() require("spectre").open_file_search({ select_word = true }) end,
        desc = "Search in current file",
      },
    },
    config = function()
      require("spectre").setup({
		is_insert_mode = true,
      })
    end,
  },
}
