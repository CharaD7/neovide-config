---@diagnostic disable: undefined-global
local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then return end

local status_ok_notify, notify = pcall(require, 'notify')
if not status_ok_notify then return end

saga.init_lsp_saga {
	border_style = "rounded",
}

notify.setup {}

-- Mappings.
local opts = { silent = true, noremap = true }
local map = vim.keymap.set

-- See `:help vim.lsp.*` for documentation on any of the below functions
map("n", "<space>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<space>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

local on_attach = function(client, bufnr)
	if client.server_capabilities.document_formatting then
		map("n", "<space>fo", ":lua vim.lsp.buf.formatting()<CR>", opts)
	end
	if client.server_capabilities.document_range_formatting then
		map("v", "<space>fo", ":lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	local msg = string.format("Language server %s started!", client.name)
	notify(msg, "info", { title = "LSP Notify", timeout = 1001 })

end
