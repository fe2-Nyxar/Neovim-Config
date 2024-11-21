local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

vim.keymap.set("n", "<leader>a", function()
    local Cdir = vim.fn.expand('%:p')
    if string.match(Cdir, "oil://") == nil then
        mark.add_file()
    else
        vim.notify("you can't add this")
    end
end)
vim.keymap.set("n", "M", ui.toggle_quick_menu)

vim.keymap.set("n", "me", function() ui.nav_file(1) end)
vim.keymap.set("n", "mz", function() ui.nav_file(2) end)
vim.keymap.set("n", "ma", function() ui.nav_file(3) end)
vim.keymap.set("n", "ms", function() ui.nav_file(4) end)
