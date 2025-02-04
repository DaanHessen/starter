return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      -- Add command to toggle Copilot
      vim.api.nvim_create_user_command("CopilotToggle", function()
        local suggestion = require("copilot.suggestion")
        if suggestion.is_auto_triggered() then
          suggestion.disable_auto_trigger()
          vim.notify("Copilot auto-trigger disabled")
        else
          suggestion.enable_auto_trigger()
          vim.notify("Copilot auto-trigger enabled")
        end
      end, {})
    end,
  },
} 