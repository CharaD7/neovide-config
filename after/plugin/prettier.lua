local status_ok, prettier = pcall(require, 'prettier')
if not status_ok then return end

prettier.setup {
  bin = "prettier", -- or `prettierd`
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
		"lua",
		"rust",
	},
}
