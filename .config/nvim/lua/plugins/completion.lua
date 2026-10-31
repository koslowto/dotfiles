require("blink.cmp").setup({
    keymap = {
        preset = "default",
    	["<CR>"] = { "accept", "fallback" },
    },

    appearance = {
        nerd_font_variant = "mono",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },

        menu = {
            border = "none",
        },
    },

    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
        },
    },

    snippets = {
        preset = "default",
    },

    fuzzy = {
        implementation = "prefer_rust_with_warning",
    },
})
