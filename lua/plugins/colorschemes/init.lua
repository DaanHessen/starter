return {
  -- Import all colorschemes
  { import = "plugins.colorschemes.catppuccin" },
  { import = "plugins.colorschemes.tokyonight" },
  { import = "plugins.colorschemes.rosepine" },
  
  -- Theme switcher and persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "globals", "curdir", "tabpages", "winsize", "help", "blank", "terminal", "folds", "tabpages" } },
  },
  
  -- Theme switcher UI
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      local themes = require("telescope.themes")
      return {
        extensions = {
          themes = themes.get_dropdown(),
        },
      }
    end,
    keys = {
      {
        "<leader>ut",
        function()
          vim.cmd("Telescope colorscheme enable_preview=true")
          -- Save the colorscheme choice
          local colorscheme = vim.g.colors_name
          if colorscheme then
            vim.fn.writefile({ string.format("vim.cmd.colorscheme('%s')", colorscheme) }, vim.fn.stdpath("config") .. "/lua/config/colorscheme.lua")
          end
        end,
        desc = "Select Theme",
      },
    },
  },
} 