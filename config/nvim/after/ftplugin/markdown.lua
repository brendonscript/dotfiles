local map = require('utils.helpers').ft_map

vim.opt_local.autowriteall = true
vim.opt_local.autowrite = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.spell = false

map('n', '<leader>md', '<cmd>.s/-.*]/- [x]<cr><cmd>nohl<cr>', { desc = 'Mark as complete' })
map('n', '<leader>mD', '<cmd> .s/-.*[x]]/- [ ] <cr><cmd>nohl<cr>', { desc = 'Mark as incomplete' })
map('n', '<leader>mt', '<cmd>silent grep! "^\\- \\[ \\]" . | copen<cr>', { desc = 'Find all todos' })
map('n', '<leader>mT', '<cmd>silent grep! "^\\- \\[ \\]" "%:p" | copen<cr>', { desc = 'Find todos in current file' })

map('n', 'gd', function()
  if require('obsidian').util.cursor_on_markdown_link() then
    return '<cmd>ObsidianFollowLink<CR>'
  else
    return 'gd'
  end
end, { noremap = false, expr = true })
