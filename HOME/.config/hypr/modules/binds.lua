local prog = require("modules/programs")
local mainMod = "SUPER"

-- Launchers
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(prog.terminal))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(prog.browser))

-- Noctalia Shell IPC
local function noctalia(cmd)
  return "noctalia-shell ipc call " .. cmd
end

-- Launchers
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctalia("launcher toggle")))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(noctalia("nightLight toggle")))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctalia("launcher clipboard")))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(noctalia("sessionMenu toggle")))
hl.bind(mainMod .. " + SEMICOLON", hl.dsp.exec_cmd(noctalia("controlCenter toggle")))
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd(noctalia("launcher emoji")))

-- Media/Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia("volume increase")), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia("volume decrease")), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctalia("volume muteOutput")), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctalia("media playPause")), { locked = true })

-- Window Controls
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

-- Workspace navigation
for i = 1, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Master Layout
hl.bind(mainMod .. " + M", hl.dsp.layout("focusmaster auto"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + H", hl.dsp.layout("focusmaster auto"))
hl.bind(mainMod .. " + L", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + K", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapnext"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapprev"))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.layout("mfact -0.05"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.layout("mfact +0.05"))
hl.bind(mainMod .. " + CTRL + M", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + CTRL + SHIFT + M", hl.dsp.layout("removemaster"))

-- Scrolling Layout
-- hl.bind(mainMod .. " + L", hl.dsp.layout("move +col"))
-- hl.bind(mainMod .. " + H", hl.dsp.layout("move -col"))
-- hl.bind(mainMod .. " + SPACE", hl.dsp.layout("fit active"))
-- hl.bind(mainMod .. " + CTRL + SPACE", function()
--   hl.config({
--     scrolling = {
--       focus_fit_method = 0,
--     },
--   })
--   hl.dispatch(hl.dsp.focus({ window = "activewindow" }))
--   hl.config({
--     scrolling = {
--       focus_fit_method = 1,
--     },
--   })
-- end)

-- Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
