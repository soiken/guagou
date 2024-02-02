function sellAndRun(npc, path, nextLocation)
  snd.send("sell vermin to " .. npc)
  snd.send("path track " .. path)
  if snd.toggles.vermin ~= true then
    snd.toggle("vermin")
  end
  snd.runPath(nextLocation)
  if snd.toggles.fasthunt == true then
    snd.toggle("fasthunt")
  end
end

if snd.toggles.vermin == true then
  local area = gmcp.Room.Info.area

  if area == "Spinesreach" then
    sellAndRun("ghada", 43846,"duiran")
  elseif area == "Duiran" then
    sellAndRun("nysos", 9194,"bloodloch")
  elseif area == "Bloodloch" then
    sellAndRun("enzo", 11687,"spinesreach")
  end
end
