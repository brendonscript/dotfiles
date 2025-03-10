return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.highlight = {
        enable = false,
      }
      opts.ensure_installed = {
        'angular',
        'bash',
        'c',
        'c_sharp',
        'css',
        'gitcommit',
        'gitignore',
        'vimdoc',
        'html',
        'javascript',
        'json',
        'json5',
        'jsonc',
        'lua',
        'fish',
        'luap',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'scss',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      }
    end,
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    opts = {},
  },
  {
    'folke/flash.nvim',
    opts = {
      search = {
        -- search/jump in all windows
        multi_window = true,
        -- search direction
        forward = true,
        -- when `false`, find only matches in the given direction
        wrap = true,
        ---@type Flash.Pattern.Mode
        -- Each mode will take ignorecase and smartcase into account.
        -- * exact: exact match
        -- * search: regular search
        -- * fuzzy: fuzzy search
        -- * fun(str): custom function that returns a pattern
        --   For example, to only match at the beginning of a word:
        --   mode = function(str)
        --     return "\\<" .. str
        --   end,
        mode = 'exact',
        -- behave like `incsearch`
        incremental = false,
        filetype_exclude = { 'notify', 'noice' },
      },
      jump = {
        autojump = false,
        nohlsearch = false,
      },
      label = {
        -- add a label for the first match in the current window.
        -- you can always jump to the first match with `<CR>`
        current = true,
        -- show the label after the match
        after = true, ---@type boolean|number[]
        -- show the label before the match
        before = false, ---@type boolean|number[]
        -- position of the label extmark
        style = 'overlay', ---@type "eol" | "overlay" | "right_align" | "inline"
        -- flash tries to re-use labels that were already assigned to a position,
        -- when typing more characters. By default only lower-case labels are re-used.
        reuse = 'lowercase', ---@type "lowercase" | "all"
      },
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = true,
          config = function(opts)
            -- autohide flash when in operator-pending mode
            -- opts.autohide = vim.fn.mode(true):find('no') and vim.v.operator == 'y'

            -- disable jump labels when enabled and when using a count
            opts.jump_labels = opts.jump_labels and vim.v.count == 0
            --
            -- Show jump labels only in operator-pending mode
            -- opts.jump_labels = opts.jump_labels and vim.v.count == 0 and not vim.fn.mode(true):find('o')
          end,
          jump_labels = false,
          multi_line = false,
          highlight = { backdrop = false },
        },
      },
    },
  },
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    config = function(_, opts)
      local cursors = require('vscode-multi-cursor')
      cursors.setup(opts)
      local k = vim.keymap.set
      k({ 'n', 'x' }, 'mc', cursors.create_cursor, { expr = true, desc = 'Create cursor' })
      k({ 'n' }, 'mcc', cursors.cancel, { desc = 'Cancel/Clear all cursors' })
      k({ 'n', 'x' }, 'mi', cursors.start_left, { desc = 'Start cursors on the left' })
      k({ 'n', 'x' }, 'mI', cursors.start_left_edge, { desc = 'Start cursors on the left edge' })
      k({ 'n', 'x' }, 'mo', cursors.start_right, { desc = 'Start cursors on the right' })
      -- k({ 'n', 'x' }, 'mO', cursors.start_right_edge, { desc = 'Start cursors on the right edge' })
      k({ 'n' }, '[mc', cursors.prev_cursor, { desc = 'Goto prev cursor' })
      k({ 'n' }, ']mc', cursors.next_cursor, { desc = 'Goto next cursor' })
      k({ 'n' }, 'mcs', cursors.flash_char, { desc = 'Create cursor using flash' })
      k({ 'n' }, 'mcw', cursors.flash_word, { desc = 'Create selection using flash' })
    end,
  },
  {
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        add = 'gza',
        delete = 'gzd',
        find = 'gzf',
        find_left = 'gzF',
        highlight = 'gzh',
        replace = 'gzr',
        update_n_lines = 'gzn',
      },
    },
  },
}
