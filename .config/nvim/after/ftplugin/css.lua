vim.b.use_omnifunc = true

vim.lsp.start({
	name = "vscode-css-language-server",
	cmd = { "vscode-css-language-server", "--stdio" },
	root_dir =  vim.loop.cwd(),
})
