-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init.

local map = vim.keymap.set

-- Save file
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Undo/Redo
map({ "n", "i", "v" }, "<C-z>", "<cmd>undo<cr>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-r>", "<cmd>redo<cr>", { desc = "Redo" })

-- Copy/Paste/Select All
map({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to system clipboard" })
map({ "n", "v" }, "<C-x>", '"+x', { desc = "Cut to system clipboard" })
map({ "n", "v", "i" }, "<C-v>", '"+p', { desc = "Paste from system clipboard" })
map({ "n" }, "<C-a>", "ggVG", { desc = "Select all" })
map({ "i" }, "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- Terminal mappings
-- <leader>ot to open terminal in the current dir in a new window
map("n", "<leader>ot", function()
  local current_dir = vim.fn.getcwd()
  vim.fn.system(
    string.format(
      'pwsh -NoProfile -Command "Start-Process pwsh -ArgumentList \\"-NoExit\\", \\"-Command\\", \\"cd \'%s\'\\"" -WindowStyle Normal',
      current_dir
    )
  )
end, { desc = "Open external terminal in current directory" })

-- <leader>tt to open terminal in new tab
map("n", "<leader>tt", "<cmd>tab term<cr>", { desc = "Open terminal in new tab" })
