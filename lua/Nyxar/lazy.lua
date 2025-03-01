local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	print("installing lazy.nvim")
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
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
	},
	--- statusline bar ---
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy" },
	-- plugin for showing harpoon 2 on lualine --
	{
		"letieu/harpoon-lualine",
		dependencies = {},
	},
	--- indent-line ---
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	--- tabline bar ---
	--[[	{
		"romgrk/barbar.nvim",
		init = function()
			vim.g.barbar_auto_setup = false
		end,
	},--]]
	--- file explorer ---
	{
		"stevearc/oil.nvim",
		opts = {},
	},
	-- edit remote files from the local environment.
	{
		"chipsenkbeil/distant.nvim",
		branch = "v0.3",
	},
	-- presence on discord
	{
		"vyfor/cord.nvim",
		build = ":cord update",
		event = "VeryLazy",
		--opts = {}, calls require('cord').setup()
	},
	--- open url on the fly ---
	{
		"sontungexpt/url-open",
		branch = "mini",
		event = "VeryLazy",
		cmd = "URLOpenUnderCursor",
	},
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
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
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	--- color highlighter ---
	{ "norcalli/nvim-colorizer.lua" },
	--- better Comments ---
	{ "numToStr/Comment.nvim" },
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
	},
	--- transparent background ---
	--  { 'tribela/vim-transparent' },
	-- formatter --
	{
		"stevearc/conform.nvim",
		branch = "master",
		event = "BufWritePre",
	},
	--setting up the lsp
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	-- lsp setup end here
	--- neovim terminal ---
	{ "nvim-tree/nvim-web-devicons" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "mbbill/undotree" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "hardhackerlabs/theme-vim", priority = 6 },
	{ "ellisonleao/gruvbox.nvim", priority = 5, config = true, opts = ... },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/plenary.nvim", lazy = true },
}

--local opts = {}
require("lazy").setup(plugins, {
	ui = {
		border = "rounded",
	},
})
