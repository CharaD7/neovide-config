local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then return end

local typescript_snippets = '../../snippets/typescript'
local python_snippets = '../../snippets/python'
local rust_snippets = '../../snippets/rust'

local snips = function(opts)
  luasnip.config.set_config(opts)

  -- vscode format
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load { paths = vim.g.vscode_snippets_path or { typescript_snippets, python_snippets, rust_snippets } }

  -- lua format
  require('luasnip.loaders.from_lua').lazy_load()
  require('luasnip.loaders.from_lua').lazy_load { paths = vim.g.lua_snippets_path or '' }
end

return snips
