local fluid_types = {
    venoms = {
    "epteth",
    "gecko",
    "epseth",
    "prefarar",
    "delphinium",
    "digitalis",
    "curare",
    "darkshade",
    "hepafarin",
    "monkshood",
    "oculus",
    "selarnia",
    "kalmia",
    "xentio",
    "eurypteria",
    "aconite",
    "vernalius",
    "slike",
    "euphorbia",
    "larkspur",
    "oleander",
    "voyria",
    },
    
    elixirs = {
    "health",
    "mana",
    "immunity",
    "levitation",
    "antivenin",
    "frost",
    "speed",
    "vigor",
    "purgative",
    "infusion"
    },
    
    poultices = {
    "mending",
    "mass",
    "restoration",
    "caloric",
    "epidermal",
    "soothing"
    },
  }
  
  local currentIndex = 1
  local currentAmount = 0
  local targetAmount = tonumber(matches[2])
  
  local function buyNextFluidType()
      if currentIndex > #fluid_types[matches[3]] then
          -- All fluid types have been purchased
          return
      end
      
      local fluidType = fluid_types[matches[3]][currentIndex]
      snd.send("buy refill of " .. fluidType .. " for fluidcache")
      currentAmount = currentAmount + 1
  
      if currentAmount >= targetAmount then
          currentIndex = currentIndex + 1
          currentAmount = 0
      end
  
      tempTimer(1, buyNextFluidType) -- Wait for 0.5 seconds before buying the next one
  end
  
  buyNextFluidType() -- Start buying the first fluid type
  