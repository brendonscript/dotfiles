local utils = require('utils.helpers')
local opt = vim.opt

opt.timeoutlen = 2000

if utils.is_mac or utils.is_linux then
  opt.shell = '/bin/sh'
end

-- opt.clipboard = 'unnamedplus'
-- if utils.is_wsl or vim.g.vscode then
--   vim.api.nvim_set_var('clipboard', {
--     name = 'WslClipboard',
--     copy = {
--       ['+'] = 'clip.exe',
--       ['*'] = 'clip.exe',
--     },
--     paste = {
--       ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0,
--   })
-- end
