if snd.toggles.vermin == true then
  local area = gmcp.Room.Info.area

  if area == "Spinesreach" then
    snd.send("sell vermin to ghada")
      snd.send("eat pie")
    if snd.toggles.vermin == true then
      snd.send("path track 43846")
      send("path track 43846")
      snd.runPath("duiran")
      else snd.toggle("vermin")
      if snd.toggles.fasthunt == true then 
        snd.toggle("fasthunt") end
    end
  elseif area == "Duiran" then
    snd.send("sell vermin to nysos")
      snd.send("eat snack")
    if snd.toggles.vermin == true then
      snd.send("path track 9194")
      send("path track 9194")
      snd.runPath("bloodloch")
      else snd.toggle("vermin")
      if snd.toggles.fasthunt == true then 
        snd.toggle("fasthunt") end
    end
  elseif area == "Bloodloch" then
    snd.send("sell vermin to enzo")
      snd.send("eat mousse")
    if snd.toggles.vermin == true then
      snd.send("path track 11687")
      send("path track 11687")
      snd.runPath("spinesreach")
      else snd.toggle("vermin")
      if snd.toggles.fasthunt == true then 
        snd.toggle("fasthunt") end
    end
  --elseif area == "the City of Enorian" then
    --snd.send("sell vermin to shrift")
    --if snd.toggles.vermin == true then
      --snd.send("TOGGLE VERMIN")
      --snd.send("MPP")
      --snd.send("path track Spinesreach")
      --tempTimer(10, function()
        --if snd.toggles.vermin == false then
          --snd.send("TOGGLE VERMIN")
          --snd.send("MPP")
        --end
        --snd.send("GOAREA") -- Move this command inside the timer function
      --end)
    --end
  end
end
