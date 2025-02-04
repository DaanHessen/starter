return {
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      local wilder = require('wilder')
      wilder.setup({
        modes = {':', '/', '?'},
        next_key = '<Tab>',
        previous_key = '<S-Tab>',
      })
      
      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlights = {
            border = 'Normal',
          },
          border = 'rounded',
          pumblend = 20,
        })
      ))
    end,
    dependencies = {
      "romgrk/fzy-lua-native",
    },
  },
} 