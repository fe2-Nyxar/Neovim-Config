local lsp = require("lsp-zero")

local lsp_list = {
	"luau_lsp",
	"lua_ls",
	"eslint",
	"ts_ls",
	"bashls",
	"intelephense",
	"cssls",
	"cssmodules_ls",
	"css_variables",
	"tailwindcss",
	"jsonls",
	"docker_compose_language_service",
	"dockerls",
	"emmet_language_server",
	"html",
	"graphql",
	"solidity",
	"hyprls",
	"yamlls",
	"helm_ls",
}

require("mason").setup({
	ui = {
		border = "rounded",
	},
})
require("mason-lspconfig").setup({
	ensure_installed = lsp_list,
	auto_update = true,
})

local lspconfig = require("lspconfig")
lspconfig.nixd.setup({
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "nixfmt" },
			},
			--[[ options = {
			  nixos = {
			      expr = '(builtins.getFlake "/PATH/TO/FLAKE").nixosConfigurations.CONFIGNAME.options',
			  },
			  home_manager = {
			      expr = '(builtins.getFlake "/PATH/TO/FLAKE").homeConfigurations.CONFIGNAME.options',
			  },
			}, ]]
		},
	},
})

lspconfig.yamlls.setup({
	settings = {
		filetypes = { "yaml", "yml" },
		yaml = {
			schemas = {
				kubernetes = "*.k8s.{yml,yaml}",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.1-standalone-strict/all.json"] = "*.k8s.{yml,yaml}",
			},
			completion = true,
			hover = true,
		},
	},
})

for _, server in ipairs(lsp_list) do
	if server ~= "yamlls" then
		lspconfig[server].setup({})
	end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.ejs" },
	callback = function()
		vim.bo.filetype = "html"
	end,
})

local cmp = require("cmp")
local cmp_action = lsp.cmp_action()
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		--[[ 		["<C-Space>"] = cmp.mapping.complete(), ]]
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	{ name = "buffer" },
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	--NOTE: diagnostics
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float()
	end, opts)

	vim.keymap.set("n", ")d", function()
		vim.diagnostic.goto_next()
	end, opts)

	vim.keymap.set("n", "(d", function()
		vim.diagnostic.goto_prev()
	end, opts)

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)

	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)

	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	--[[ vim.keymap.set("n", "leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts) ]]
	--[[ vim.keymap.set("n", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts) ]]
end)

lsp.setup()
