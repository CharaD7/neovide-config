local status_ok, dashboard = pcall(require, 'dashboard')
if not status_ok then return end

dashboard.hide_statusline = 1
dashboard.session_directory = vim.fn.stdpath('data') .. '/sessions'
dashboard.custom_center = {
  { icon = '🔎  ', desc = 'Find File                 ', shortcut = 'SPC f f', action = 'Telescope find_files' },
	{ icon = '   ', desc = 'Recents                   ', shortcut = 'SPC f r', action = 'Telescope oldfiles' },
	{ icon = '   ', desc = 'Find Word                 ', shortcut = 'SPC f w', action = 'Telescope live_grep' },
	{ icon = '洛  ', desc = 'New File                  ', shortcut = 'SPC f n', action = 'DashboardNewFile' },
	{ icon = '   ', desc = 'Bookmarks                 ', shortcut = 'SPC f m', action = 'Telescope marks' },
	{ icon = '   ', desc = 'Load Last Session         ', shortcut = 'SPC s l', action = 'SessionLoad' },
}
