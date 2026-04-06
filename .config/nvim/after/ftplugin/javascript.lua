vim.b.use_omnifunc = true

vim.lsp.start({
	name = "typescript-language-server",
	cmd = { "typescript-language-server", "--stdio" },
	root_dir =  vim.loop.cwd(),
})

vim.keymap.set('v', '<leader>c', ":norm 0i// <CR>")
vim.keymap.set('v', '<leader>C', ":norm 0xxx<CR>")
