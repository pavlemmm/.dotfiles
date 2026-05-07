local hl = require("hyprland")

-- Layout
hl.set("general", {
  layout = "scrolling"
})

hl.set("scrolling", {
  fullscreen_on_one_column = true,
  column_width = 0.5,
  focus_fit_method = 0, -- 0=center, 1=fit
  follow_focus = true,
  follow_min_visible = 0.4,
  explicit_column_widths = { 0.333, 0.5, 0.667, 1.0 },
  direction = "right"
})

hl.set("dwindle", {
  pseudotile = true,
  preserve_split = true
})

hl.set("master", {
  new_status = "master",
  mfact = 0.5
})

hl.set("binds", {
  movefocus_cycles_groupfirst = true
})
