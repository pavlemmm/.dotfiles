hl.config({
  animations = {
    enabled = true,
  },

  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,
    col = {
      active_border = "rgb(58a6ff)",
      inactive_border = "rgb(010409)",
    },
  },

  decoration = {
    rounding = 0,
  },

  group = {
    col = {
      border_active = "rgb(bc8cff)",
      border_inactive = "rgb(010409)",
      border_locked_active = "rgb(f85149)",
      border_locked_inactive = "rgb(010409)",
    },

    groupbar = {
      render_titles = false,
      indicator_height = 2,
      gaps_out = 1,
      gaps_in = 12,
      keep_upper_gap = false,
      col = {
        active = "rgb(bc8cff)",
        inactive = "rgb(010409)",
        locked_active = "rgb(f85149)",
        locked_inactive = "rgb(010409)",
      },
    },
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
})

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "default", style = "popin 85%" })
hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "default", style = "fade" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "default", style = "slidefade 15%" })
