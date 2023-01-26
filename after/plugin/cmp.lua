---@diagnostic disable: undefined-global
local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then return end

local status_ok_luasnip, luasnip = pcall(require, 'luasnip')
if not status_ok_luasnip then return end

cmp.setup {
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	-- Add borders around the popup window
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
			luasnip.lsp_expand(args.body) -- For luasnip users
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-3),
		["<C-t>"] = cmp.mapping.scroll_docs(5),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "cmp_tabnine" },
		{ name = "buffer" },
		{ name = "treesitter" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "spell" },
	},

	-- File types specifics
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" },
		}, {
			{ name = "buffer" },
		}),
	}),

	-- Command line completion
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = { { name = "buffer" } },
	}),

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		},
			{
				{ name = "cmdline" },
			}),
	}),

	formatting = {
		fields = { 'abbr' },
		format = function(entry, vim_item)
			vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
			vim_item.menu = ({
				path = "   [Path]",
				buffer = "   [Buffer]",
				nvim_lsp = "   [LSP]",
				luasnip = "   [luasnip]",
				treesitter = "   [Ts]",
				calc = "   [Calc]",
				spell = "   [Spell]",
				emoji = " ﲃ  [Emoji]",
				cmp_tabnine = "⦿   [Tn]",
			})[entry.source.name]
			return vim_item
		end,
	},
	experimental = {
		ghost_text = true,
	},
}
