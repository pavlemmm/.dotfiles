local mon1 = "DP-1"
local mon2 = "HDMI-A-1"

-- Monitors
hl.monitor({
  output = mon1,
  mode = "1920x1080@240",
  position = "1920x0",
  scale = 1,
})
hl.monitor({
  output = mon2,
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1,
})

-- Workspace mapping (1-5 on mon1, 6-10 on mon2)
for i = 1, 5 do
  hl.workspace(tostring(i), "monitor:" .. mon1)
end

for i = 6, 10 do
  local ws = i == 10 and "0" or tostring(i)
  hl.workspace(ws, "monitor:" .. mon2)
end
