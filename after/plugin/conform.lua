local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        markdown = { "prettier" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
    }
})


vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({ lsp_fallback = false, async = true })
end, { desc = "format the buf" })
