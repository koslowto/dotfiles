local map = vim.keymap.set

-- General
map("n", "<leader>q", "<cmd>quitall<CR>", { desc = "Quit all" })
map("n", "<leader>x", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>quit!<CR>", { desc = "Force quit" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save" })

-- Tabs
map("n", "<Tab>", "gt")
map("n", "<S-Tab>", "gT")
map("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "New tab" })

-- Windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<leader>s", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical split" })

-- File explorer
map("n", "<leader>e", "<cmd>Lexplore<CR>", { desc = "File explorer" })

-- Editing
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>a", "gg0vG$", { desc = "Select all" })
map("n", "<leader>c", "1z=", { desc = "Correct spelling" })

-- Clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete to clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Terminal
local terminal_close = "<C-\\><C-n><cmd>bdelete!<CR>"

map("t", "<Esc>", terminal_close, { silent = true })
map("t", "q", terminal_close, { silent = true })

-- Fuzzy finder
map("n", "<leader>f", function()
    MiniPick.builtin.files()
end, { desc = "Find files" })

map("n", "<leader>g", function()
    MiniPick.builtin.grep_live()
end, { desc = "Live grep" })

map("n", "<leader>b", function()
    MiniPick.builtin.buffers()
end, { desc = "Find buffers" })

map("n", "<leader>h", function()
    MiniPick.builtin.help()
end, { desc = "Help pages" })


vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreviewToggle<cr>", {
    buffer = true,
    desc = "Toggle Typst preview",
})

vim.keymap.set("n", "<leader>ts", "<cmd>TypstPreviewStop<cr>", {
    buffer = true,
    desc = "Stop Typst preview",
})
