local status_ok_mason, mason = pcall(require, 'mason')
if not status_ok_mason then return end

local status_ok_mason_lsp, lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok_mason_lsp then return end

mason.setup {
  automatic_installation = true,
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
}

-- Lspconfig setup
local servers = { "sumneko_lua", "jsonls", "volar", }

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
