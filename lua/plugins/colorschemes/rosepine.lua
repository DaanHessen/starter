return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = true,
  opts = {
    variant = "moon",
    dark_variant = "moon",
    disable_background = false, -- handled by transparent.nvim
    highlight_groups = {
      TelescopeBorder = { fg = "highlight_high", bg = "none" },
      TelescopeNormal = { bg = "none" },
      TelescopePromptNormal = { bg = "base" },
      TelescopeResultsNormal = { fg = "subtle", bg = "none" },
      TelescopeSelection = { fg = "text", bg = "base" },
      TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
    },
  },
} 