return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1001, -- Higher than colorscheme
    opts = {
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
        -- Additional groups for full transparency
        'NeoTreeNormal', 'NeoTreeNormalNC', -- NeoTree
        'TelescopeNormal', 'TelescopeBorder', -- Telescope
        'NotifyBackground', -- Notifications
        'WhichKeyFloat', -- Which-key
        'LazyNormal', -- Lazy
        'FloatBorder', -- Generic floating windows
        'NormalFloat', -- Generic floating windows
      },
      extra_groups = {
        "NormalFloat",
        "FloatBorder",
        "Pmenu",
        "PmenuSel",
        "PmenuSbar",
        "PmenuThumb",
        "WinBar",
        "WinBarNC",
        "TabLine",
        "TabLineFill",
        "TabLineSel",
      },
      exclude_groups = {}, -- table: groups you don't want to clear
    },
    config = function(_, opts)
      require("transparent").setup(opts)
      -- Ensure transparency is enabled by default
      vim.cmd([[TransparentEnable]])
    end,
  },
} 