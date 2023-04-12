local icons = require "chara.icons"

local function format_diagnostic(diagnostic)
  local icon = icons.diagnostics.Error
  if diagnostic.severity == vim.diagnostic.severity.WARN then
    icon = icons.diagnostics.Warning
  elseif diagnostic.severity == vim.diagnostic.severity.INFO then
    icon = icons.diagnostics.Information
  elseif diagnostic.severity == vim.diagnostic.severity.HINT then
    icon = icons.diagnostics.Hint
  end

  local message = string.format('%s %s', icon, diagnostic.message)
  if diagnostic.code and diagnostic.source then
    message = string.format('%s [%s][%s] %s', icon, diagnostic.source, diagnostic.code, diagnostic.message)
  elseif diagnostic.code or diagnostic.source then
    message = string.format('%s [%s] %s', icon, diagnostic.code or diagnostic.source, diagnostic.message)
  end

  return message .. ' '
end


vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    -- source = 'always',
    format = format_diagnostic
  }
})
