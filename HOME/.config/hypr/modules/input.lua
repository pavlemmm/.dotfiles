local hl = require("hyprland")

hl.set("input", {
  kb_layout = "us,rs,rs",
  kb_variant = ",latin,",
  kb_options = "grp:alt_shift_toggle, caps:escape, ctrl:swap_lalt_lctl, altwin:swap_ralt_rwin",

  repeat_delay = 200,
  repeat_rate = 40,

  follow_mouse = 1,
  sensitivity = 0,
  accel_profile = "flat",

  special_fallthrough = true,

  touchpad = {
    natural_scroll = true
  }
})
