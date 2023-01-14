local status_ok, transparent = pcall(require, 'transparent')
if not status_ok then return end

transparent.setup {
  enable = false, -- boolean: enable transparent
	extra_groups = { "all" },
	exclude = {}, -- table: groups you don't want to clear
}
