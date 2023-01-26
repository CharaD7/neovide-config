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
	"html",
	"emmet_ls",
	"vuels",
	"marksman",
	"intelephense",
	"solidity",
	"sqlls",
	"stylelint_lsp",
	"svelte",
	"taplo",
	"tailwindcss",
	"ruby_ls",
	"prismals",
	"jsonls",
	"rust_analyzer",
	"tsserver",
	"pyright",
	"astro",
	"bashls",
	"clangd",
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
