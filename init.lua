-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.init")

-- disable lsp logs: they tend to get big like 10gb+ which is crazy...
vim.lsp.set_log_level("off")
