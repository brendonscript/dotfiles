local M = {}

--- Print table values
---@param v table: options to pass to the picker
M.print_table = function(v)
  print(vim.inspect(v))
  return v
end

M.is_mac = function()
  return vim.fn.has 'mac' == 1
end

M.is_linux = function()
  return vim.fn.has 'linux' == 1
end

M.is_windows = function()
  return vim.fn.has 'win32' == 1
end

M.is_wsl = function()
  return vim.fn.has 'wsl' == 1
end

M.map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.ft_map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap or true
  opts.silent = opts.silent or true
  opts.buffer = opts.buffer or true
  vim.keymap.set(mode, lhs, rhs, opts)
  -- end
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

M.file_exists = function(filename)
  local lfs = require 'lfs'
  local exists = lfs.attributes(filename, 'mode') ~= nil

  if exists then
    print(filename .. ' exists!')
  else
    print(filename .. ' does not exist.')
  end
  return exists
end

M.create_scratch_file = function()
  vim.cmd 'noswapfile hide enew'
  vim.cmd 'setlocal buftype=nofile bufhidden=hide nobuflisted'
  vim.cmd 'lcd ~'
  vim.cmd 'file scratch'
end

M.create_new_tab = function()
  vim.cmd 'tabnew'
  M.create_scratch_file()
end

return M
