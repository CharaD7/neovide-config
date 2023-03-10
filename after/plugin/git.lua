---@diagnostic disable: undefined-global
local status_ok, git = pcall(require, 'git')
if not status_ok then return end

git.setup {
  keymaps = {
    -- Open blame window
    blame = '<leader>gb',
    -- Open file/folder in git repository
    browse = '<leader>go',
  }
}
