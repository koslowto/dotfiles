vim.opt_local.spell = true

vim.lsp.start({
  name = "texlab",
  cmd = { "texlab" },
  root_dir = vim.fn.getcwd(),

  settings = {
	texlab = {
	  build = {
		executable = "latexmk",
		args = { "-pdf", "-interaction=nonstopmode", "%f" },
		onSave = true,
	  },
	},
  },
})

vim.keymap.set({'n', 'i'}, '#', function() vim.api.nvim_put({"\\"}, 'c', false, true) end)
vim.keymap.set({'n', 'i'}, '\\', function() vim.api.nvim_put({"#"}, 'c', false, true) end)

vim.keymap.set('v', '<leader>c', ":norm 0i% <CR>")
vim.keymap.set('v', '<leader>C', ":norm 0xx<CR>")

vim.keymap.set('n', '<leader>o', function ()
	local f = vim.fn.expand("%:p")
	vim.api.nvim_input(":tabnew<CR>:terminal okular " .. f .. "<CR>:hide<CR>")
end)
