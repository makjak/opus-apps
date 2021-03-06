_G.requireInjector(_ENV)

local Util = require('util')

local fs     = _G.fs
local os     = _G.os
local turtle = _G.turtle

local STARTUP_FILE = 'usr/autorun/cobbleGen.lua'

if not fs.exists(STARTUP_FILE) then
  Util.writeFile(STARTUP_FILE,
    [[os.sleep(1)
shell.openForegroundTab('packages/milo/apps/cobblegen')]])
end

os.queueEvent('turtle_inventory')
while true do
  print('waiting')
  os.pullEvent('turtle_inventory')
  print('waiting for cobble')
  for _ = 1, 20 do
    if turtle.inspectDown() then
      break
    end
    os.sleep(.1)
  end
  print('digging')
  turtle.digDown()
end
