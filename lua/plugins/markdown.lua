return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && npm install",
    init = function()
      -- Fix for the "not an editor command" issue for lazy loading
      local function load_then_exec(cmd)
        return function()
          vim.cmd.delcommand(cmd)
          require("lazy").load({ plugins = { "markdown-preview.nvim" } })
          vim.api.nvim_exec_autocmds("BufEnter", {})
          vim.cmd(cmd)
        end
      end
      for _, cmd in pairs({ "MarkdownPreview", "MarkdownPreviewStop" }) do
        vim.api.nvim_create_user_command(cmd, load_then_exec(cmd), {})
      end
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_page_title = "「${name}」"
    end,
    keys = {
      { "<leader>cp", "<cmd>MarkdownPreview<cr>", desc = "Start Markdown Preview" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "vimwiki" },
    config = function()
      require("render-markdown").setup({
        enabled = true,
        render_modes = { "n", "c", "t" },
        max_file_size = 10.0,
        debounce = 100,
        preset = "none",
        log_level = "error",
        log_runtime = false,
        file_types = { "markdown" },
        anti_conceal = {
          enabled = true,
          ignore = {
            code_background = true,
            sign = true,
          },
          above = 0,
          below = 0,
        },
        padding = {
          highlight = "Normal",
        },
        latex = {
          enabled = true,
          render_modes = false,
          converter = "latex2text",
        },
      })
      -- Autocommand to jump the cursor to the first empty line after line 10
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*.md",
        callback = function()
          local target_line = 0
          local end_line = math.min(vim.fn.line("$"), 20)
          for i = 1, end_line do
            if vim.fn.getline(i) == "" then
              target_line = i
              break
            end
          end
          if target_line > 0 then
            vim.api.nvim_win_set_cursor(0, { target_line, 0 })
          else
            vim.api.nvim_win_set_cursor(0, { 1, 0 })
          end
        end,
        group = vim.api.nvim_create_augroup("MarkdownAutoCursor", { clear = true }),
      })
    end,
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdownToggle<cr>", desc = "Toggle Markdown Rendering" },
    },
  },
}

