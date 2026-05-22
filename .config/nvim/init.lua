vim.g.mapleader = " "

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.showcmd = false

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.signcolumn = "no" -- hide the lsp warning column
vim.opt.fillchars = "eob: " -- remove the tildes at the end of a buffer
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.spell = false
vim.opt.spelllang = "en,de"
vim.cmd("language en_US.utf-8")

-- File Explorer
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0 -- fix copying
vim.g.netrw_sort_sequence = [[[\/]$,*]] --sort directories above files
vim.g.netrw_liststyle = 3 --tree style listing (use 1 for standard list)
vim.g.netrw_hide = 0 -- show hidden files
vim.g.netrw_winsize = 20
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_localmkdir = "mkdir -p"
vim.g.netrw_localrmdir = "rm -r"
vim.keymap.set('n', '<leader>e', ':Lexplore<CR>')

-- Syntax Completion
vim.keymap.set('i', '<C-c>', '<C-x><C-o>')
vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
vim.opt.complete = ".,w,b,kspell"
vim.opt.completeopt = "menu,menuone,preview,noselect"
vim.opt.pumheight = 25 -- set maximum height for completion popup
vim.opt.shortmess:append("c") -- hide the pattern not found warning

vim.api.nvim_create_autocmd("TextChangedI", {
	callback = function()
		local min_chars = 4
		local line = vim.api.nvim_get_current_line()
		local col = vim.api.nvim_win_get_cursor(0)[2]
		local word = line:sub(0, col):match("%w+$") or ""
		if #word >= min_chars and vim.fn.pumvisible() == 0 then
			if vim.b.use_omnifunc == true then vim.api.nvim_input("<C-x><C-o>")
			else vim.api.nvim_input("<C-n>") end
		end
	end,
})

-- Keymaps
vim.keymap.set('n', '<leader>q', ':quitall<CR>')
vim.keymap.set('n', '<leader>x', ':quit<CR>')
vim.keymap.set('n', '<leader>!', ':quit!<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')

vim.keymap.set('n', '<Tab>', 'gt')
vim.keymap.set('n', '<S-Tab>', 'gT')
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '<leader>a', 'ggvG$')
vim.keymap.set('n', '<leader>c', '1z=')

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v', 'x'}, '<leader>d', '"+d')

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- Themeing
vim.cmd("colorscheme catppuccin_latte")
vim.opt.statusline = "%t%h%w%m%r%=  %{%wordcount().words%} words, %{%max([wordcount().chars-1,0])%} chars  %l,%c"
