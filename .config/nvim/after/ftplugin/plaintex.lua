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
