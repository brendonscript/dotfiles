return {
  'folke/flash.nvim',
  opts = {
    modes = {
      char = {
        keys = { 'f', 'F', 't', 'T', ']', '[' },
        ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
        char_actions = function(motion)
          return {
            [']'] = 'next', -- set to `right` to always go right
            ['['] = 'prev', -- set to `left` to always go left
            [motion:lower()] = 'next',
            [motion:upper()] = 'prev',
          }
        end,
      },
    },
  },
}
