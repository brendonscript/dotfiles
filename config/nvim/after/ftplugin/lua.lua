local map = require('utils.helpers').ft_map

map({ 'n', 'v' }, '<leader>mr', '<cmd>source %<cr>', { desc = 'Run buffer' })
