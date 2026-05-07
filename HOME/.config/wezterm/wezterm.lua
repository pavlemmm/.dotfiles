local wezterm = require 'wezterm'

return {
  -- Font
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  font_size = 13.0,

  -- Padding
  window_padding = {
    left = 6,
    right = 6,
    top = 6,
    bottom = 6,
  },

  -- Window
  -- adjust_window_size_when_changing_font_size = false,
  -- window_close_confirmation = "NeverPrompt", -- confirm-close-surface = false
  hide_tab_bar_if_only_one_tab = true,

  -- Opacity
  -- window_background_opacity = 0.8,

  -- Resize overlay
  -- enable_scroll_bar = false,

  -- Performance / behavior
  -- front_end = "WebGpu",

  -- Theme (Noctalia - custom)
  color_scheme = "Noctalia",
}
