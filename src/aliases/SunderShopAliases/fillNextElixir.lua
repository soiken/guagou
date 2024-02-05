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

local function fillNextElixir()
    if currentIndex > #elixirs then
        -- All elixirs have been filled
        return
    end

    local elixir = elixirs[currentIndex]
    snd.send("fc fill " .. elixir)
    currentIndex = currentIndex + 1

    tempTimer(1, fillNextElixir) -- Wait for 0.5 seconds before filling the next elixir
end

fillNextElixir() -- Start filling the first elixir
