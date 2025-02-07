return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional
    -- 'ibhagwan/fzf-lua',
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gG', '<cmd>Neogit<cr>', desc = 'Neogit' },
  },
  opts = {
    integrations = {
      -- telescope = true,
      -- fzf_lua = true,
      diffview = true,
    },
  },
}
