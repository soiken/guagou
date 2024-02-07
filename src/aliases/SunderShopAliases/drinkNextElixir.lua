local elixirs = {
    "health",
    "mana",
    "immunity",
    "levitation",
    "antivenin",
    "frost",
    "speed",
    "vigor",
    "infusion",
    "purgative"
    }
    
    local currentIndex = 1
    
    local function drinkNextElixir()
        if currentIndex > #elixirs then
            -- All elixirs have been consumed
            return
        end
    
        local elixir = elixirs[currentIndex]
        snd.send("drink " .. elixir)
        currentIndex = currentIndex + 1
    
        tempTimer(1, drinkNextElixir) -- Wait for 0.5 seconds before consuming the next elixir
    end
    
    drinkNextElixir() -- Start consuming the first elixir