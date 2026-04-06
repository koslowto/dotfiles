vim.opt_local.spell = true
vim.opt_local.textwidth = 45

vim.keymap.set('v', '<leader>c', ":norm 0i[//]: <CR>")
vim.keymap.set('v', '<leader>C', ":norm 0xxxxxx<CR>")

vim.keymap.set('n', '<leader>o', function ()
	local f = vim.fn.expand("%:p")
	vim.api.nvim_input(":tabnew<CR>:terminal okular " .. f .. "<CR>:hide<CR>")
end)
