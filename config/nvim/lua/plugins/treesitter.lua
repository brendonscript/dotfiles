return {
  'nvim-treesitter/nvim-treesitter',
  opts = function(_, opts)
    opts.endwise = {
      enable = true,
    }
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      'tsx',
      'typescript',
    })
  end,
}
