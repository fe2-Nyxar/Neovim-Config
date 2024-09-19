require'nvim-treesitter.configs'.setup {
	ensure_installed = {
        "zig",
		"lua",
        "luau",
		"javascript",
        "typescript",
		"c",
		"php",
		"css",
        "nix",
        "toml",
        "fish",
        "bash",
        "json",
        "jsonc",
        "dockerfile",
        "yaml",
        "python",
        "rust",
        "html",
        "graphql",
        "solidity",
        "yuck",
        "rasi",
        "scss",

	},
	sync_install = false,
    indent = {
        enable = true,
    },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
}


