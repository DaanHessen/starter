return {
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    keys = {
      ":", "/", "?"
    },
    config = function()
      local wilder = require('wilder')
      -- Only enable wilder when using these keys
      vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
        callback = function()
          local cmdtype = vim.fn.getcmdtype()
          if cmdtype == ":" or cmdtype == "/" or cmdtype == "?" then
            wilder.enable()
          end
        end,
      })

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1,
            set_pcre2_pattern = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
          }),
          wilder.vim_search_pipeline()
        )
      })

      local highlighters = {
        wilder.lua_fzy_highlighter(),
      }

      -- Create a beautiful popupmenu theme
      local popupmenu_renderer = wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          border = 'rounded',
          highlights = {
            border = 'FloatBorder',
            default = 'Normal',
            accent = 'WilderAccent',
            selected = 'Visual',
          },
          left = {
            ' ',
            wilder.popupmenu_devicons(),
          },
          right = {
            ' ',
            wilder.popupmenu_scrollbar(),
          },
          highlighter = highlighters,
          pumblend = 15,
          min_width = '15%',     -- Reduced width
          max_width = '25%',     -- Maximum width cap
          min_height = '0%',     -- Minimum height
          max_height = '35%',    -- Maximum height
          reverse = true,        -- Position menu on the right
          left_offset = 0,       -- No left offset
          right_offset = 0,      -- No right offset
          margin = 0,            -- No margin
        })
      )

      -- Apply the renderer
      wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = popupmenu_renderer,
        ['/'] = popupmenu_renderer,
        ['?'] = popupmenu_renderer,
      }))

      -- Set up highlight groups
      vim.api.nvim_set_hl(0, 'WilderAccent', { fg = '#7aa2f7', bold = true })
    end,
    dependencies = {
      "romgrk/fzy-lua-native",
      "nvim-tree/nvim-web-devicons",
    },
  },
} 