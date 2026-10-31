-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    signs = false,
    severity_sort = true,

    float = {
        border = "rounded",
        source = "if_many",
    },
})

-- Shared LSP settings
local on_attach = on_attach
-- local capabilities = capabilities
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Rust
vim.lsp.config("rust_analyzer", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),

    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
        },
    },
})

-- Typst
vim.lsp.config.tinymist = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "tinymist" },
    filetypes = { "typst" },
    root_markers = { "typst.toml", ".git" },
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onSave",
    },
}

-- Enable language servers
vim.lsp.enable({
    "clangd",
    "pylsp",
    "tinymist",
    "rust_analyzer",
})

-- LSP attachment
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local buf = ev.buf

        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, {
                buffer = buf,
                desc = desc,
            })
        end

        -- Navigation
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Find references")

        -- Diagnostics
        map("<leader>k", vim.diagnostic.open_float, "Show diagnostic")
        map("gn", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, "Next diagnostic")

        map("gp", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, "Previous diagnostic")

        -- Refactoring
        map("<leader>r", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")

        -- Native LSP completion
--        if client:supports_method("textDocument/completion") then
--            vim.lsp.completion.enable(
--                true,
--                client.id,
--                buf,
--                { autotrigger = true }
--            )
--
--            vim.keymap.set("i", "<C-Space>", function()
--                vim.lsp.completion.get()
--            end, {
--                buffer = buf,
--                desc = "Trigger LSP completion",
--            })
--        end
    end,
})
