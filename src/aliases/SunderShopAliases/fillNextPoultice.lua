local poultices = {
    "mending",
    "mass",
    "restoration",
    "caloric",
    "epidermal",
}

local currentIndex = 1

local function fillNextPoultice()
    if currentIndex > #poultices then
        -- All poultices have been filled
        return
    end

    local poultice = poultices[currentIndex]
    snd.send("fc fill " .. poultice)
    currentIndex = currentIndex + 1

    tempTimer(1, fillNextPoultice) -- Wait for 0.5 seconds before filling the next poultice
end

fillNextPoultice() -- Start filling the first poultice
