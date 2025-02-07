-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = require('utils').helpers.augroup

-- -- Remove unneed lazyvim augroups
vim.api.nvim_del_augroup_by_name 'lazyvim_resize_splits'
vim.api.nvim_del_augroup_by_name 'lazyvim_wrap_spell'

vim.api.nvim_del_augroup_by_name 'lazyvim_auto_create_dir'
--
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup 'resize_splits',
  callback = function()
    local savetab = vim.api.nvim_tabpage_get_number(0)
    vim.cmd 'tabdo wincmd ='
    vim.cmd("execute 'tabnext' " .. savetab)
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup 'auto_create_dir',
  callback = function(event)
    if vim.tbl_contains({ 'oil' }, vim.bo.ft) then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

vim.api.nvim_create_user_command('Scratch', function()
  require('utils').helpers.create_scratch_file()
end, {})

vim.api.nvim_create_user_command('NewTab', function()
  require('utils').helpers.create_new_tab()
end, {})
