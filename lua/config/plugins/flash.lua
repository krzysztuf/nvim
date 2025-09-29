return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      search = {
        multi_window = true,
        incremental = true,
        wrap = true,  -- Enable wrapping to search whole file
        forward = true,
        backward = true,
        mode = "fuzzy",  -- Use fuzzy search which is more reliable over SSH
      },
      modes = {
        search = {
          enabled = false,
          highlight = { backdrop = false },  -- Disable backdrop for SSH
          jump = { history = true, register = true, nohlsearch = true },
        },
        char = {
          enabled = true,
          jump_labels = true,
          multi_line = true,
          highlight = { backdrop = false },
        },
      },
      -- Force whole buffer search
      prompt = {
        enabled = true,
        prefix = { { "⚡", "FlashPromptIcon" } },
      },
    },
    keys = {
      { "s", mode = { "n" }, function() 
        require("flash").jump({
          search = { 
            mode = "search", 
            multi_window = true,
            wrap = true,
            forward = true,
            backward = true 
          }
        }) 
      end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "<leader>hw", function() 
        require("flash").jump({
          search = { wrap = true, multi_window = true }
        }) 
      end, desc = "Flash jump" },
      { "<leader>hl", function() require("flash").jump({ pattern = "^" }) end, desc = "Flash to line start" },
      { "f", mode = { "n", "x", "o" }, function() 
        require("flash").jump({ 
          search = { 
            mode = "search", 
            max_length = 0,
            wrap = false,
            forward = true 
          }, 
          label = { after = { 0, 0 } }, 
          pattern = "^" 
        }) 
      end, desc = "Flash forward in line" },
      { "F", mode = { "n", "x", "o" }, function() 
        require("flash").jump({ 
          search = { 
            mode = "search", 
            max_length = 0, 
            forward = false,
            wrap = false
          }, 
          label = { after = { 0, 0 } }, 
          pattern = "^" 
        }) 
      end, desc = "Flash backward in line" },
    },
  },
}
