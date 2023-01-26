---@diagnostic disable: undefined-global
local status_ok_mason, mason = pcall(require, 'mason')
if not status_ok_mason then return end

local status_ok_mason_lsp, lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok_mason_lsp then return end

mason.setup {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
}

-- Lspconfig setup
local servers = {
	"sumneko_lua",
	"html-lsp",
	"emmet-ls",
	"black",
	"blackd-client",
	"marksman",
	"debugpy",
	"intelephense",
	"solidity",
	"sqlls",
	"stylelint_lsp",
	"svelte",
	"taplo",
	"tailwindcss",
	"teal_ls",
	"ruby_ls",
	"prismals",
	"jsonls",
	"vue-language-server",
	"rust_analyzer",
	"tsserver",
	"pyright",
	"astro",
	"bashls",
	"clangd",
	"css-lsp",
	"dockerls",
	"eslint",
	"emmet_ls",
	"gopls"
}

lspconfig.setup {
	ensure_installed = servers,
	automatic_installation = true,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
			}
		}
	}
}
