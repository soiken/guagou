local function checkVitals()
    local epRatio = gmcp.Char.Vitals.ep / gmcp.Char.Vitals.maxep
  
    if epRatio <= 0.5 then
      mmp.pause("on")
      send("sleep")
      -- Since we want to pause further actions, no timer is needed here.
    elseif epRatio >= 0.9 then
      mmp.pause("off")
      send("wake")
      send("stand")
      -- No need to check again since we're above the threshold.
    else
      -- If the epRatio is between 0.5 and 0.9, we keep checking.
      addTimer(1, "checkVitals") -- Make sure the timer's callback is the function's exact name.
    end
  end
  
  -- Initially call the function to start the checking process.
  checkVitals()
  