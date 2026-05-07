local hl = require("hyprland")

hl.set("general", {
  gaps_in = 0,
  gaps_out = 0,
  border_size = 1,
})

hl.set("decoration", {
  rounding = 0
})

hl.set("group", {
  groupbar = {
    render_titles = false,
    indicator_height = 2,
    gaps_out = 1,
    gaps_in = 12,
    keep_upper_gap = false
  }
})

hl.set("misc", {
  force_default_wallpaper = 0,
  disable_hyprland_logo = true
})
