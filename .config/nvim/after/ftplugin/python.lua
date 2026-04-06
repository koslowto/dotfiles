vim.keymap.set('v', '<leader>c', ":norm 0i# <CR>")
vim.keymap.set('v', '<leader>C', ":norm 0xx<CR>")

-- make and run programm
vim.keymap.set('n', '<leader>m', function()
	local filename = vim.fn.expand("%")
	vim.cmd("update")
	vim.cmd("split term://zsh")
	vim.api.nvim_input("isource .venv/bin/activate<CR>python3 " .. filename .. "<CR>")
end)
