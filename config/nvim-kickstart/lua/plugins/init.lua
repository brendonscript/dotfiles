return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      style = 'storm',
    },
    config = function(opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },
}
