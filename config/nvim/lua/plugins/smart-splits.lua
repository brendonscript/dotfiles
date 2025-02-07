return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  opts = {},
  keys = {
    {
      '<C-h>',
      function()
        require('smart-splits').move_cursor_left()
      end,
      mode = { 'n' },
      desc = 'Move Left',
    },
    {
      '<C-l>',
      function()
        require('smart-splits').move_cursor_right()
      end,
      mode = { 'n' },
      desc = 'Move Right',
    },
    {
      '<C-j>',
      function()
        require('smart-splits').move_cursor_down()
      end,
      mode = { 'n' },
      desc = 'Move Down',
    },
    {
      '<C-k>',
      function()
        require('smart-splits').move_cursor_up()
      end,
      mode = { 'n' },
      desc = 'Move Up',
    },
    {
      '<C-A-h>',
      function()
        require('smart-splits').resize_left()
      end,
      mode = { 'n' },
      desc = 'Resize Left',
    },
    {
      '<C-A-L>',
      function()
        require('smart-splits').resize_right()
      end,
      mode = { 'n' },
      desc = 'Resize Right',
    },
    {
      '<C-A-J>',
      function()
        require('smart-splits').resize_down()
      end,
      mode = { 'n' },
      desc = 'Resize Down',
    },
    {
      '<C-A-k>',
      function()
        require('smart-splits').resize_up()
      end,
      mode = { 'n' },
      desc = 'Resize Up',
    },
  },
}
