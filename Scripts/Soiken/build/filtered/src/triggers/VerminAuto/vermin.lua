if snd.toggles.vermin then
    if snd.toggles.newbie then
      send("k vermin")
    else
    --single attack logic
      snd.bashing.target = "vermin"
      battack = ""
      for k,v in pairs(snd.class_list) do
        if snd.class_list[k].class == snd.class then
        if snd[v.class:lower().."_bash_override"] then
          snd[v.class:lower().."_bash_override"]()
        else
          v.func()
        end
        snd.send("qeb stand"..snd.sep..battack)
        end
      end
    end
  end
  snd.vermin = snd.vermin + 1
  if snd.vermin >= 1 then
   if snd.toggles.vermin == true then
           if bot.going then
        tempTimer(1, snd.move)
      end
          disableTimer("moveroom")
   end
  end