local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    --- Dashboard screen (startup screen) ---
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    --- status bar ---
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    --- file explorer ---
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    --- open url on the fly ---
    -- lazy.nvim
    {
        "sontungexpt/url-open",
        branch = "mini",
        event = "VeryLazy",
        cmd = "URLOpenUnderCursor",
        --[[ config = function()
            local status_ok, url_open = pcall(require, "url-open")
            if not status_ok then
                return
            end
            url_open.setup({})
        end,--]]
    },
    --- lazygit ---
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    --- color highlighter ---
    { 'norcalli/nvim-colorizer.lua' },
    --- better Comments ---
    { 'numToStr/Comment.nvim' },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    --- transparent background ---
    { 'tribela/vim-transparent' },
    --setting up the lsp
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    -- lsp setup end here
    --- neovim terminal ---
    { 'akinsho/toggleterm.nvim',          version = "*",      config = true },
    { "mbbill/undotree" },
    { "ThePrimeagen/harpoon" },
    { 'hardhackerlabs/theme-vim' },
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "ellisonleao/gruvbox.nvim",         priority = 1000,    config = true, opts = ... },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
}

local opts = {}
require("lazy").setup(plugins);
