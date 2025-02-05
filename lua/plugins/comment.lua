return {
  "numToStr/Comment.nvim",
  opts = {
    padding = true,      -- Add a space between comment and the line
    sticky = true,       -- Cursor stays at its position
    ignore = nil,        -- Lines to be ignored while (un)commenting

    -- Toggle mappings in NORMAL mode:
    toggler = {
        line = '<C-_>',  -- Change line-comment toggle to Ctrl-/
        block = '<C-_>', -- (Or, if you want, leave block-comment toggle different)
    },

    -- Operator-pending mappings in NORMAL and VISUAL mode:
    opleader = {
        line = '<C-_>',  -- Change line-comment mapping to Ctrl-/
        block = '<C-_>', -- Change block-comment mapping to Ctrl-/
    },

    -- Extra mappings (for adding comments above, below, or at end of line)
    extra = {
        above = '<C-_>O',  -- Add comment on the line above
        below = '<C-_>o',  -- Add comment on the line below
        eol   = '<C-_>A',  -- Add comment at the end of line
    },

    -- Enable keybindings:
    mappings = {
        basic = true,  -- Operator-pending mappings (e.g. using <C-_> with a motion)
        extra = true,  -- Extra mappings (e.g. <C-_>O, <C-_>o, <C-_>A)
    },

    pre_hook = nil,
    post_hook = nil,
  },
}

