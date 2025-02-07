local M = {}

--- Print table values
---@param v table: options to pass to the picker
M.print_table = function(v)
  print(vim.inspect(v))
  return v
end

M.is_mac = function()
  return vim.loop.os_uname().sysname == 'Darwin'
end

M.is_linux = function()
  return vim.loop.os_uname().sysname == 'Linux'
end

M.is_windows = function()
  return vim.loop.os_uname().sysname == 'CYGWIN' or vim.loop.os_uname().sysname == 'MINGW'
end

M.is_wsl = function()
  return M.is_linux() and vim.fn.executable('wslpath') == 1
end

M.map = function(mode, lhs, rhs, opts)
  local keys = require('lazy.core.handler').handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

M.augroup = function(name)
  return vim.api.nvim_create_augroup('peronal_' .. name, { clear = true })
end

--- Create user commands
--- @param cmds table<string, any>
M.create_commands = function(cmds)
  for key, value in pairs(cmds) do
    vim.api.nvim_create_user_command(key, value, {})
  end
end

--- Create autocmds for FileType
--- @param cmds table<string, any>
M.ft_commands = function(cmds)
  for key, value in pairs(cmds) do
    vim.api.nvim_create_autocmd('FileType', {
      group = M.augroup(key),
      pattern = { key },
      callback = value,
    })
  end
end

--- Create autocmds for FileType
--- @param ft string: file type
--- @param cb function: callback
M.ft_command = function(ft, cb)
  vim.api.nvim_create_autocmd('FileType', {
    group = M.augroup(ft .. '_single'),
    pattern = { ft },
    callback = cb,
  })
end

M.close_floats = function()
  local closed_windows = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then -- is_floating_window?
      vim.api.nvim_win_close(win, false) -- do not force
      table.insert(closed_windows, win)
    end
  end
  print(string.format('Closed %d windows: %s', #closed_windows, vim.inspect(closed_windows)))
end
return M
