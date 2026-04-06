vim.opt_local.spell = true

-- change # and \ key
vim.keymap.set('i', '#', function()
	if vim.fn.expand("%:e") == "tex" then
		vim.api.nvim_put({"\\"}, 'c', false, true)
	else
		vim.api.nvim_put({"#"}, 'c', false, true)
	end end)

-- change \ and # key
vim.keymap.set('i', '\\', function()
	if vim.fn.expand("%:e") == "tex" then
		vim.api.nvim_put({"#"}, 'c', false, true)
	else
		vim.api.nvim_put({"\\"}, 'c', false, true)
	end end)

-- comment lines in visual selection
vim.keymap.set('v', '<leader>c', function ()
	vim.api.nvim_input(": norm 0i% <CR>")
end)

-- uncomment lines in visual selection
vim.keymap.set('v', '<leader>C', function ()
	vim.api.nvim_input(": norm 0xx<CR>")
end)
