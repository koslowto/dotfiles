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
	local f = vim.fn.expand("%:r") .. ".pdf"
	vim.api.nvim_input(":tabnew<CR>:terminal okular " .. f .. "<CR>:hide<CR>")
end)

local myname = "Tobias Koslowski"
local filename = string.gsub(vim.fn.expand("%:t:r"), "_", " ")
local date = os.date("%B %Y")
local template = {
	"\\documentclass{article}", "", "\\usepackage{graphicx}",
	"\\usepackage{amsmath}", "\\usepackage{amssymb}",
	"\\usepackage{geometry}", "\\usepackage{fancyhdr}", "\\usepackage{enumitem}",
	"", "\\def\\docname{" .. filename .. "}",
	"\\def\\me{" .. myname .."}",
	"\\def\\now{" .. date .. "}",
	"\\title{\\docname}", "\\author{\\me}", "\\date{\\now}", "",
	"\\geometry{a4paper, portrait, margin=2.5cm}", "\\pagestyle{fancy}",
	"\\pagenumbering{gobble}", "\\setlength\\parindent{0pt}",	"",
	"\\fancyhead[L]{\\me}",
	"\\fancyhead[C]{\\textbf{\\docname}}",
	"\\fancyhead[R]{\\now}", "",
	"\\begin{document}", "", "", "", "\\end{document}",
}

local bufnr = vim.api.nvim_get_current_buf()
local line_count = vim.api.nvim_buf_line_count(bufnr)
if line_count <= 1 then -- check for empty buffer
	vim.api.nvim_buf_set_lines(0, 0, 0, false, template) -- insert the template text into the buffer
	vim.api.nvim_input("dd" .. 28 .. "Ga") -- delete the remaining empty line, then go to desired position
end
