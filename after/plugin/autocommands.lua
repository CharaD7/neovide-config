local create = vim.api.nvim_create_autocmd
local nvim_exec = vim.api.nvim_exec

-- remove trailing whitespaces
create({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd [[ %s/\s\+$//e ]]
    vim.cmd [[ %s/\n\+\%$//e ]]
  end
})
-- vim.cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]
-- vim.cmd [[ autocmd BufWritePre * %s/\n\+\%$//e ]]

-- Alpha Dashboard
create({ 'User' }, {
  pattern = { 'AlphaReady' },
  callback = function()
    vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Attach colorizer to all buffers
create({ 'BufRead' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd [[ ColorizerAttachToBuffer ]]
  end
})


-- Set all .rsh files to use js syntax and highlighting
create({ 'BufRead' }, {
  pattern = { '.rsh' },
  callback = function()
    vim.cmd [[
      set filetype=reach
      set syntax=javascript
    ]]
  end
})

-- Open in last edit point
create({ 'BufReadPost' }, {
  callback = function()
    vim.cmd [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif ]]
  end
})

-- Live compile sass  and scss files
create({ 'BufWritePost' }, {
  pattern = {
    '[^_]*.sass',
    '[^_]*.scss'
  },
  callback = function()
    vim.cmd [[ silent! exec '!sass %:p %:r.css' ]]
  end
})

-- Set all .ipynb files to have python syntax
create({ 'BufRead' }, {
  pattern = { '.ipynb' },
  callback = function()
    vim.cmd [[ set syntax=python ]]
  end
})

-- Update lightbulb on CursorHold
create({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    local status_ok, lightbulb = pcall(require, 'nvim-lightbulb')
    if not status_ok then return end

    vim.cmd [[ lua require('nvim-lightbulb').update_lightbulb() ]]
  end
})

-- Notify for file changes outside of neovim and reload buffer
create({ 'FileChangedShellPost' }, {
  pattern = { '*' },
  callback = function()
    local status_ok, notify = pcall(require, 'notify')
    if not status_ok then return end

    vim.cmd [[
      call v:lua.vim.notify(
        'File changed on disk. Buffer reloaded!',
        'warn',
        {
          'title': 'File Notify',
          'timeout': 1001
        }
      )
    ]]
  end
})

-- Bufferline background for zephyr colorscheme
create({ 'VimEnter' }, {
  callback = function()
    -- Selected Bufferline
    vim.cmd [[
      highlight BufferLineBufferSelected guibg=#262A33 guifg=#FFFFFF
      highlight BufferLineNumbersSelected guibg=#262A33 guifg=#FFFFFF
    ]]
    -- Warning Seleceted BufferLine
    vim.cmd [[
      highlight BufferLineWarningSelected guibg=#262A33
      highlight BufferLineWarningDiagnosticSelected guibg=#262A33 guifg=#EFB839
    ]]
    -- Error Selected BufferLine
    vim.cmd [[
      highlight BufferLineErrorSelected guibg=#262A33
      highlight BufferLineErrorDiagnosticSelected guibg=#262A33 guifg=#EC5241
    ]]
    -- Info Selected BufferLine
    vim.cmd [[
      highlight BufferLinerInfoSelected guibg=#262A33
      highlight BufferLinerInfoDiagnosticSelected guibg=#262A33 guifg=#7EA9A7
    ]]
    -- Hint Selected BufferLine
    vim.cmd [[
      highlight BufferLineHintSelected guibg=#262A33
      highlight BufferLineHintDiagnosticSelected guibg=#262A33 guifg=#A3BA5E
    ]]
  end
})

-- Border color for all floating windows
create({ 'VimEnter' }, {
  callback = function()
    vim.cmd [[ highlight FloatBorder guifg=#61AFEF ]]
  end
})

-- Italic font support for various neovim highlights
create({ 'VimEnter' }, {
  callback = function()
    -- All Keywords
    vim.cmd [[ autocmd ColorScheme zephyr highlight Keyword gui=italic cterm=italic ]]
    -- All Comments
    vim.cmd [[ autocmd ColorScheme zephyr highlight Comment gui=italic cterm=italic ]]
    -- All Functions
    vim.cmd [[ autocmd ColorScheme zephyr highlight Function gui=italic cterm=italic ]]
    -- All Constants
    vim.cmd [[ autocmd ColorScheme zephyr highlight Constant gui=italic cterm=italic ]]
    -- All Exceptions
    vim.cmd [[ autocmd ColorScheme zephyr highlight Exception gui=italic cterm=italic ]]
    -- All Types
    vim.cmd [[ autocmd ColorScheme zephyr highlight Type gui=italic cterm=italic ]]
    -- All Labels
    vim.cmd [[ autocmd ColorScheme zephyr highlight Label gui=italic cterm=italic ]]
    -- All Includes
    vim.cmd [[ autocmd ColorScheme zephyr highlight Include gui=italic cterm=italic ]]
    -- All StorageClasses
    vim.cmd [[ autocmd ColorScheme zephyr highlight StorageClass gui=italic cterm=italic ]]
    -- All Structures
    vim.cmd [[ autocmd ColorScheme zephyr highlight Structure gui=italic cterm=italic ]]
    -- All Typedefs
    vim.cmd [[ autocmd ColorScheme zephyr highlight Typedef gui=italic cterm=italic ]]
    -- All SpecialComments
    vim.cmd [[ autocmd ColorScheme zephyr highlight SpecialComment gui=italic cterm=italic ]]
    -- All PreProcs
    vim.cmd [[ autocmd ColorScheme zephyr highlight PreProc gui=italic cterm=italic ]]
  end
})

-- IndentBlankline colors
create({ 'VimEnter' }, {
  callback = function()
    vim.cmd [[
      highlight IndentBlanklineIndent2 guifg=#E06C75 gui=nocombine
      highlight IndentBlanklineIndent3 guifg=#E5C07B gui=nocombine
      highlight IndentBlanklineIndent4 guifg=#98C379 gui=nocombine
      highlight IndentBlanklineIndent5 guifg=#56B6C2 gui=nocombine
      highlight IndentBlanklineIndent6 guifg=#61AFEF gui=nocombine
      highlight IndentBlanklineIndent7 guifg=#C678DD gui=nocombine
    ]]
  end
})

-- Configuring Reach language intellisense
create({ 'BufRead' }, {
  pattern = { '*.rsh' },
  callback = function()
    vim.cmd [[
      let g:LanguageClient_serverCommands = { 'reach': '~/.local/share/nvim/site/reach-ide/server/out/server.js', '--stdio' }
      let g:LanguageClient_loggingLevel = 'DEBUG'
      let g:LanguageClient_loggingFile = expand('~/.local/share/nvim/site/reach-ide/reach-language-client.log')
      let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/site/reach-ide/reach-language-server.log')
    ]]
  end
})

-- Configure Scrollbar
-- When to show
create({
  'CursorMoved',
  'VimResized',
  'QuitPre',
  'WinEnter',
  'FocusGained'
}, {
  callback = function()
    vim.cmd [[ silent! lua require('scrollbar').show() ]]
  end
})
-- When to hide
create({ 'WinLeave', 'BufWinLeave', 'FocusLost' }, {
  callback = function()
    vim.cmd [[ silent! lua require('scrollbar').clear() ]]
  end
})

-- Check time on buffer window enter
create({ 'BufWinEnter' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd 'checktime'
  end,
})

-- Unlink current luasnipet
create({ 'CursorHold' }, {
  callback = function()
    local status_ok, luasnip = pcall(require, 'luasnip')
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      vim.cmd [[silent! lua require('luasnip').unlink_current()]]
    end
  end,
})

-- Make ts BufWrites asynchronous
create({ 'BufWritePost' }, {
  pattern = { '*.ts' },
  callback = function()
    vim.lsp.buf.format { async = true }
  end,
})

-- Avoid delays on yank in Visual mode
create({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 200 }
  end,
})

-- Telescope project
create({ 'BufEnter' }, {
  pattern = { '' },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, '/')
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir() .. ' - nvim'
  end,
})

-- If buffer is emtpy, close
create({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "" or buf_ft == nil then
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <c-j> j<CR>
      nnoremap <silent> <buffer> <c-k> k<CR>
      set nobuflisted
    ]]
    end
  end,
})