local opt = vim.opt
opt.guifont = 'MonoLisa,Symbols Nerd Font Mono:h20'
opt.linespace = 0
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_scroll_animation_length = 0.2
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_underline_automatic_scaling = true
vim.g.neovide_no_idle = true
-- vim.g.neovide_refresh_rate = 60
-- vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_confirm_quit = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0.4
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true

-- Helper function for transparency formatting
-- local alpha = function()
--   return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point or 0.8))
-- end
-- -- Set transparency and background color (title bar color)
-- vim.g.neovide_transparency = 0.0
-- vim.g.neovide_transparency_point = 0.8
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
-- -- Add keybinds to change transparency
-- local change_transparency = function(delta)
--   vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
--   vim.g.neovide_background_color = "#0f1117" .. alpha()
-- end
-- vim.keymap.set({ "n", "v", "o" }, "<leader>u+", function()
--   change_transparency(0.01)
-- end, { desc = "Increase Transparency" })
-- vim.keymap.set({ "n", "v", "o" }, "<leader>u-", function()
--   change_transparency(-0.01)
-- end, { desc = "Increase Transparency" })
