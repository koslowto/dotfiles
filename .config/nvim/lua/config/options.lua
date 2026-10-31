local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.showcmd = false
opt.signcolumn = "no"
opt.fillchars = { eob = " " }
opt.termguicolors = true

-- Indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.smarttab = true
opt.smartindent = true

-- Files
opt.undofile = true
opt.swapfile = false

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Spelling
opt.spell = false
opt.spelllang = { "en", "de" }

-- Completion
opt.complete = { ".", "w", "b", "kspell" }
opt.completeopt = { "menuone", "noselect", "popup" }
opt.pumheight = 25

-- Messages
opt.shortmess:append("c")

-- Statusline (your original word/character counter)
opt.statusline =
    "%t%h%w%m%r%=  %{%wordcount().words%} words, " ..
    "%{%max([wordcount().chars-1,0])%} chars  %l,%c"

-- Language
vim.cmd.language("en_US.utf-8")

-- NetRW
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_liststyle = 3
vim.g.netrw_hide = 0
vim.g.netrw_winsize = 20
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_localmkdir = "mkdir -p"
vim.g.netrw_localrmdir = "rm -r"
