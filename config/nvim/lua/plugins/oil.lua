return {
  'stevearc/oil.nvim',
  lazy = false,
  keys = {
    {
      '-',
      function()
        require('oil').open()
      end,
      desc = 'Oil',
    },
    {
      '_',
      function()
        require('oil').open_float()
      end,
      desc = 'Oil Floating',
    },
  },
  opts = {
    columns = {
      'icon',
    },
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['<M-v>'] = 'actions.select_vsplit',
      ['<M-s>'] = 'actions.select_split',
      ['gv'] = 'actions.select_vsplit',
      ['gs'] = 'actions.select_split',
      ['gS'] = 'actions.change_sort',
      ['<C-l>'] = false,
      ['<C-s>'] = 'actions.select_vsplit',
      ['<C-h>'] = false,
      ['<C-p>'] = 'actions.preview',
      ['<C-r>'] = 'actions.refresh',
      ['q'] = 'actions.close',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['<C-c>'] = 'actions.tcd',
      ['~'] = false,
      ['.'] = 'actions.toggle_hidden',
    },

    cleanup_delay_ms = 3000,

    lsp_file_methods = {
      autosave_changes = true,
    },
    experimental_watch_for_changes = true,
    git = {
      add = function(_)
        return true
      end,
      mv = function(_, _)
        return true
      end,
      rm = function(_)
        return true
      end,
    },

    -- Window-local options to use for oil buffers
    -- win_options = {
    --   concealcursor = 'n',
    -- },
    -- restore_win_options = true,
    view_options = {
      show_hidden = true,
    },
    default_file_explorer = false,
    use_default_keymaps = true,
    buf_options = {
      buflisted = false,
      bufhidden = 'hide',
    },
    delete_to_trash = true,
  },
}
