return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        deepseek = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            log_level = "DEBUG",
            env = {
              url = "https://api.deepseek.com",
              api_key = "DEEPSEEK_API_KEY",
              chat_url = "/v1/chat/completions",
            },
            request = {
              timeout_ms = 15000,  -- Set API request timeout in ms
              max_retries = 3,     -- Configure retry count for failed connections
              retry_delay_ms = 1000, -- Delay between retries in ms
            },
            schema = {
              model = {
                default = "deepseek-coder",
              },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "deepseek" },
        inline = { adapter = "deepseek" },
        agent = { adapter = "deepseek" },
      },
    })
  end,
  keys = {
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
    { "<C-s>", "<cmd>CodeCompanionSend<cr>", desc = "Send Chat Message" },
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionAdd",
    "CodeCompanionChat",
    "CodeCompanionToggle",
    "CodeCompanionSend",
  },
}
