return {
  {
    'saghen/blink.cmp',
    opts = {
      keymap = {
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-f>'] = { 'select_and_accept' },
      },
      completion = {
        list = {
          selection = {
            preselect = function()
              return not require('blink.cmp').snippet_active { direction = 1 }
            end,
          },
        },
      },
    },
  },
}
