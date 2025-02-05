return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  config = function()
    require("neogit").setup {}
    vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Open Neogit status" })
  end,
} 