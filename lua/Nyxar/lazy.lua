local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    print("installing lazy.nvim");
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
    },
    --- status bar ---
    {
        'nvim-lualine/lualine.nvim',
    },
    --- file explorer ---
    {
        'stevearc/oil.nvim',
        opts = {},
    },
    --- open url on the fly ---
    {
        'vyfor/cord.nvim',
        build = './build || .\\build',
        event = 'VeryLazy',
        --opts = {}, calls require('cord').setup()
    },
    {
        "sontungexpt/url-open",
        branch = "mini",
        event = "VeryLazy",
        cmd = "URLOpenUnderCursor",
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
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    --- transparent background ---
    --  { 'tribela/vim-transparent' },
    -- formatter --
    {
        'stevearc/conform.nvim',
        branch = 'nvim-0.9',
        opts = {},
    },
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
    { "nvim-tree/nvim-web-devicons" },
    { 'akinsho/toggleterm.nvim',          version = "*",      config = true },
    { "mbbill/undotree" },
    { "ThePrimeagen/harpoon" },
    { 'hardhackerlabs/theme-vim' },
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "ellisonleao/gruvbox.nvim",         priority = 1000,    config = true, opts = ... },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
    },
    { 'nvim-lua/plenary.nvim' }
}

--local opts = {}
require("lazy").setup(plugins);
