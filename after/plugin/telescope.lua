require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim" -- add this value
        }
    }
}
local builtin = require('telescope.builtin')

-- local search in limited in the current directory only
vim.keymap.set('n', '<leader>pf', function()
    local Cdir = vim.fn.expand('%:p')
    if Cdir == "" then
        builtin.find_files()
    else
        Cdir = string.gsub(Cdir, "oil://", "");
        Cdir = string.gsub(Cdir, "[^/]+%.%w+$", "");
        print(Cdir);
        builtin.find_files({ cwd = Cdir })
    end
end, {})

-- default global search
vim.keymap.set('n', '<leader>pp', builtin.find_files, {})
-- git files in a dir
vim.keymap.set('n', '<C-:>', function()
    local Cdir = vim.fn.expand("%:p")
    Cdir = string.gsub(Cdir, "oil://", "")
    Cdir = string.gsub(Cdir, "[^/]+%.%w+$", "")
    builtin.git_files({ cwd = Cdir })
end
, {})

--[[vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)--]]
