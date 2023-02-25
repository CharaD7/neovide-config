local function format_diagnostic(diagnostic)
  local icon = " "
  if diagnostic.severity == vim.diagnostic.severity.WARN then
    icon = " "
  elseif diagnostic.severity == vim.diagnostic.severity.INFO then
    icon = " "
  elseif diagnostic.severity == vim.diagnostic.severity.HINT then
    icon = " "
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
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    format = format_diagnostic
  }
})
