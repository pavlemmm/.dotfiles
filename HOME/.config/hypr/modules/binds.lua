local hl = require("hyprland")
local prog = require("modules/programs")
local mainMod = "SUPER"

-- Launchers
hl.bind(mainMod, "RETURN", "exec", prog.terminal)
hl.bind(mainMod, "Q", "exec", prog.browser)

-- Noctalia Shell IPC
local function noctalia(cmd)
  return "noctalia-shell ipc call " .. cmd
end

-- Launchers
hl.bind(mainMod, "A", "exec", noctalia("launcher toggle"))
hl.bind(mainMod, "T", "exec", noctalia("nightLight toggle"))
hl.bind(mainMod, "V", "exec", noctalia("launcher clipboard"))
hl.bind(mainMod, "ESCAPE", "exec", noctalia("sessionMenu toggle"))
hl.bind(mainMod, "SEMICOLON", "exec", noctalia("controlCenter toggle"))
hl.bind(mainMod, "PERIOD", "exec", noctalia("launcher emoji"))

-- Media/Volume
hl.bind("", "XF86AudioRaiseVolume", "exec", noctalia("volume increase"))
hl.bind("", "XF86AudioLowerVolume", "exec", noctalia("volume decrease"))
hl.bind("", "XF86AudioMute", "exec", noctalia("volume muteOutput"))
hl.bind("", "XF86AudioPlay", "exec", noctalia("media playPause"))

-- Window Controls
hl.bind(mainMod, "W", "killactive")
hl.bind(mainMod .. " SHIFT", "SPACE", "fullscreen", 2)
hl.bind(mainMod, "F", "togglefloating")

-- Workspace navigation
for i = 1, 9 do
  hl.bind(mainMod, tostring(i), "workspace", tostring(i))
  hl.bind(mainMod .. " SHIFT", tostring(i), "movetoworkspace", tostring(i))
end
hl.bind(mainMod, "0", "workspace", "10")
hl.bind(mainMod .. " SHIFT", "0", "movetoworkspace", "10")

-- Navigation (HJKL)
hl.bind(mainMod .. " CTRL", "H", "movefocus", "l")
hl.bind(mainMod .. " CTRL", "L", "movefocus", "r")
hl.bind(mainMod .. " CTRL", "J", "movefocus", "d")
hl.bind(mainMod .. " CTRL", "K", "movefocus", "u")

-- Scrolling Layout
hl.bind(mainMod, "L", "layoutmsg", "move +col")
hl.bind(mainMod, "H", "layoutmsg", "move -col")
hl.bind(mainMod, "SPACE", "layoutmsg", "fit active")

-- Mouse (bindm for mouse)
hl.bindm(mainMod, "mouse:272", "movewindow")
hl.bindm(mainMod, "mouse:273", "resizewindow")
