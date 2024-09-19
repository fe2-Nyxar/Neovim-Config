require "url-open".setup({
    open_only_when_cursor_on_url = true,
    highlight_url = {
        all_urls = {
            enabled = true,
            fg = "#B0E0E6"
        },
        cursor_move = {
            enabled = true,
            fg = "#A3CFFF",
            bg = nil,
            underline = true,
        },

    }
})


vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")

--TEST: https://chatgpt.com/c/66e650e4-1654-8008-b304-0532012f1b52
