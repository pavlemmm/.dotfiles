local hl = require("hyprland")

local mon1 = "DP-1"
local mon2 = "HDMI-A-1"

-- Monitors
hl.monitor(mon1, "1920x1080@240", "1920x0", 1)
hl.monitor(mon2, "1920x1080@60", "0x0", 1)

-- Workspace mapping (1-5 on mon1, 6-10 on mon2)
for i = 1, 5 do
  hl.workspace(tostring(i), "monitor:" .. mon1)
end

for i = 6, 10 do
  local ws = i == 10 and "0" or tostring(i)
  hl.workspace(ws, "monitor:" .. mon2)
end
