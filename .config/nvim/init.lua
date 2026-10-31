vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.env.RIPGREP_CONFIG_PATH = vim.fn.stdpath("config") .. "/ripgreprc"

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins")

require("plugins.mini")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.completion")
require("plugins.typst")

vim.cmd.colorscheme("catppuccin-latte")
