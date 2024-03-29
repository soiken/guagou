ProgressDisplay = ProgressDisplay or {
  font = "Ubuntu Mono",
  fontSize = 10,
  height = 200,
  width = 400,
  goldLog = {},
  expLog = {},
}

-- Inventory management
inv = inv or {}

local function itemList(_, _)
  local event = gmcp.Char.Items.List
  if event.location ~= "inv" then
    return
  end
  inv = {}
  for _, item in pairs(event.items) do
    inv[item.id] = item
  end
  sortedItems = {}
  for id, item in pairs(inv) do
    table.insert(sortedItems, {name = item.name, id = id})
  end
  table.sort(sortedItems, function(a, b) return a.name < b.name end)
  raiseEvent("inventory updated")
  display(sortedItems)
end


local function itemRemove()
  local event = gmcp.Char.Items.Remove
  if event.location ~= "inv" then
    return
  end
  inv[event.item.id] = nil
  raiseEvent("inventory updated")
end

local function itemAdd()
  local event = gmcp.Char.Items.Add
  if event.location ~= "inv" then
    return
  end
  inv[event.item.id] = event.item
  raiseEvent("inventory updated")
end

local function itemUpdate()
  local event = gmcp.Char.Items.Update
  if event.location ~= "inv" then
    return
  end
  inv[event.item.id] = event.item
  raiseEvent("inventory updated")
end

-- Register the event handler
registerAnonymousEventHandler("gmcp.Char.Items.List", "itemList")


-- Register the event handler
registerAnonymousEventHandler("gmcp.Char.Items.List", "itemList")


function ProgressDisplay:reset()
  self.goldLog = {}
  self.expLog = {}
  self.startTime = os.time()
end

function ProgressDisplay.format_int(number)
  number = math.floor(number)
  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
  -- reverse the int-string and append a comma to all blocks of 3 digits
  int = int:reverse():gsub("(%d%d%d)", "%1,")
  -- reverse the int-string back remove an optional comma and put the 
  -- optional minus and fractional part back
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

function ProgressDisplay.breakdownTime(time)
  local hours, minutes, seconds = shms(time)
  hours = tonumber(hours)
  minutes = tonumber(minutes)
  seconds = tonumber(seconds)
  local days = math.floor(hours / 24)
  hours = hours % 24
  return days, hours, minutes, seconds
end

function ProgressDisplay:create()
  self.container = Adjustable.Container:new({
    name = "Progress Display",
    x = 0,
    y = 0,
    height = self.height,
    width = self.width,
  })
  self.console = Geyser.MiniConsole:new({
    name = "progress displayinator gold console",
    x = 0,
    y = 0,
    height = "100%",
    width = "100%",
    font = self.font,
    fontSize = self.fontSize,
    color = "black",
  }, self.container)
  self:update()
end

function ProgressDisplay:show()
  self.container:show()
  self:update()
end

function ProgressDisplay:hide()
  self.container:hide()
end

function ProgressDisplay:update()
  if self.container.hidden then return end
  self:expCheck()
  self:goldCheck()
  self:displayInventory()
end

function ProgressDisplay:goldUpdate(amount)
  local goldLog = self.goldLog
  local where = gmcp.Room.Info
  local when = os.time()
  local logEntry = {
    ["where"] = {
      ["roomNum"] = where.num,
      ["area"] = where.area,
    },
    ["when"] = when,
    ["amount"] = amount,
  }
  goldLog[#goldLog+1] = logEntry
  self:update()
end

function ProgressDisplay:expUpdate(amount)
  local expLog = self.expLog
  local where = gmcp.Room.Info
  local when = os.time()

  local entry = {
    ["where"] = {
      ["roomNum"] = where.num,
      ["area"] = where.area,
    },
    ["when"] = when,
    ["amount"] = amount,
  }
  expLog[#expLog+1] = entry
  self:update()
end

function ProgressDisplay:expCheck()
  local console = self.console
  local total = 0
  if not self.startTime then
    self.startTime = os.time()
  end
  local startTime = self.startTime
  local endTime = os.time()
  local thisArea, thisRoom = "Unknown", "Unknown"
  if gmcp.Room and gmcp.Room.Info then
    thisArea = gmcp.Room.Info.area
    thisRoom = gmcp.Room.Info.num
  end
  local areaExp = 0
  local roomExp = 0
  console:clear()
  for _, log in ipairs(self.expLog) do
    if log.where.area == thisArea then
      areaExp = areaExp + log.amount
    end
    if log.where.roomNum == thisRoom then
      roomExp = roomExp + log.amount
    end
    total = total + log.amount
  end
  local duration = endTime - startTime
  local days, hours, minutes, seconds = self.breakdownTime(duration)
  local timeString = f"{days} days {hours} hours {minutes} minutes {seconds} seconds"

  local xph = total / (duration / 60 / 60)
  local xpToLevel, xpPercentGained = "Unknown", "Unknown"
  if gmcp.Char and gmcp.Char.Vitals then
    xpToLevel = tonumber(gmcp.Char.Vitals.maxxp) - tonumber(gmcp.Char.Vitals.xp)
    xpPercentGained = string.format("%.2f", (total*100)/tonumber(gmcp.Char.Vitals.maxxp))
  end
  local timeToLevel = "Infinity"
  if xph > 1 then
    timeToLevel = string.format("%.2f", xpToLevel / xph)
  end

  local readable_total = self.format_int(total)
  local readable_xph = self.format_int(xph)


  console:cecho(f[[
<white>Area        : <green>{thisArea}
<white>Time Period : <green>{timeString}
<LightSlateBlue>Exp change  : {total<0 and "<red>" or "<green>"}{readable_total} <green>({xpPercentGained}%)
<LightSlateBlue>Exp/Hour    : {xph<0 and "<red>" or "<green>"}{readable_xph}
<LightSlateBlue>Hrs to Lvl  : <yellow>{timeToLevel} <green>hours
]])
end

function ProgressDisplay:goldCheck()
  local console = self.console
  local goldLog = self.goldLog
  local total = 0
  local startTime = self.startTime
  local endTime = os.time()
  local thisArea = "Unknown"
  if gmcp.Room and gmcp.Room.Info then
    thisArea = gmcp.Room.Info.area:gsub("an unstable section of ","")
  end
  local areaGold = 0
  for _, log in ipairs(goldLog) do
    if log.where.area == thisArea then
      areaGold = areaGold + log.amount
    end
    total = total + log.amount
  end
  local duration = endTime - startTime
  local gps = total / duration
  local gph = total / (duration/60/60)

  console:cecho(string.format([[
<yellow>Gold change : %s%s
<yellow>Gold in area: <green>%s
<yellow>Gold/Second : <green>%.2f
<yellow>Gold/Hour   : <green>%.2f
]], total <= 0 and "<red>" or "<green>", total, areaGold, gps, gph))
end

function ProgressDisplay:displayInventory()
  local console = self.console
  console:cecho("\n<pink>Inventory Items:\n")

  -- Create two tables to store items: one for wearing and one for the rest
  local wearingItems = {}
  local otherItems = {}

  -- Iterate through the inventory and separate items based on wearslot
  for id, item in pairs(inv) do
    if item.wearslot then
      table.insert(wearingItems, {name = item.name, id = id, icon = item.icon})
    else
      table.insert(otherItems, {name = item.name, id = id, icon = item.icon})
    end
  end

  -- Sort both tables alphabetically by name
  table.sort(wearingItems, function(a, b) return a.name < b.name end)
  table.sort(otherItems, function(a, b) return a.name < b.name end)

  -- Display the wearing items first
  console:cecho("\n<yellow>Wearing:\n\n")
  for _, item in pairs(wearingItems) do
    local icon = item.icon or "question-circle" -- Default icon if not provided
    console:cecho(string.format("<white>%s <orange>%s\n", item.id, item.name))
  end

  -- Display the rest of the items
  console:cecho("\n<yellow>Other Items:\n\n")
  for _, item in pairs(otherItems) do
    local icon = item.icon or "question-circle" -- Default icon if not provided
    console:cecho(string.format("<white>%s <orange>%s\n", item.id, item.name))
  end
end





-- Register the event handler for "gmcp.Char.Items.List" only once
registerAnonymousEventHandler("gmcp.Char.Items.List", "itemList")
registerNamedTimer("ProgressDisplay", "regular update", 1, function() ProgressDisplay:update() end, true)
registerNamedEventHandler("inv","login","gmcp.Char.Name", function() sendGMCP("Char.Items.Inv") end)
registerNamedEventHandler("inv","List","gmcp.Char.Items.List", itemList)
registerNamedEventHandler("inv","Add","gmcp.Char.Items.Add", itemAdd)
registerNamedEventHandler("inv","Remove","gmcp.Char.Items.Remove", itemRemove)
registerNamedEventHandler("inv","Update","gmcp.Char.Items.Update", itemUpdate)
