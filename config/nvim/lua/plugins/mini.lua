return {
  {
    'echasnovski/mini.move',
    lazy = false,
    opts = {
      mappings = {
        line_up = '<M-K>',
        line_left = '<M-H>',
        line_down = '<M-J>',
        line_right = '<M-L>',

        down = 'J',
        up = 'K',
        left = '<M-H>',
        right = '<M-L>',
      },
    },
  },
  {
    'echasnovski/mini.surround',
    optional = true,
    opts = {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        find = 'gzf', -- Find surrounding (to the right)
        find_left = 'gzF', -- Find surrounding (to the left)
        highlight = 'gzh', -- Highlight surrounding
        replace = 'gzr', -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`
      },
    },
  },
  -- {
  --   'echasnovski/mini.animate',
  --   optional = true,
  --   opts = {
  --     cursor = {
  --       enable = false,
  --     },
  --     scroll = {
  --       enable = false,
  --     },
  --   },
  -- },
}
