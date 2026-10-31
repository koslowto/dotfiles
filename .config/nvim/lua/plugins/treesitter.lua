-- Enable Tree-sitter highlighting when a parser is available
vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
    end,
})

require("nvim-treesitter").install({
    "c",
    "cpp",
    "rust",
    "python",
    "lua",
    "bash",
    "javascript",
    "json",
    "yaml",
    "html",
    "css",
    "typst",
})
