return {
  'neovim/nvim-lspconfig',
  -- commit = '88157521e890fe7fdf18bee22438875edd6300a6',
  opts = function(_, opts)
    local keys = require('lazyvim.plugins.lsp.keymaps').get()
    keys[#keys + 1] = { 'gl', vim.diagnostic.open_float, desc = 'Line Diagnostics' }
    keys[#keys + 1] = { 'ga', vim.lsp.buf.code_action, desc = 'Code Actions' }
    keys[#keys + 1] = { 'gt', false }
    opts.inlay_hints = {
      enabled = false,
    }
  end,
}
