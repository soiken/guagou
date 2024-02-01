local function checkVitals()
    if gmcp.Char.Vitals.ep / gmcp.Char.Vitals.maxep >= 0.9 then
      send("wake")
      send("stand")
      mmp.pause("off")
    else
      -- Keep checking by invoking the alias repeatedly with a delay
      addTimer(1, "check_vitals")
    end
  end
  
  checkVitals()
  