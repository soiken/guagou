local elixirs = {
    "health",
    "mana",
    "immunity",
    "levitation",
    "antivenin",
    "frost",
    "speed",
    "vigor",
    }
    
    local currentIndex = 1
    
    local function consumeNextElixir()
        if currentIndex > #elixirs then
            -- All elixirs have been consumed
            return
        end
    
        local elixir = elixirs[currentIndex]
        snd.send("fc consume " .. elixir)
        currentIndex = currentIndex + 1
    
        tempTimer(1, consumeNextElixir) -- Wait for 0.5 seconds before consuming the next elixir
    end
    
    consumeNextElixir() -- Start consuming the first elixir