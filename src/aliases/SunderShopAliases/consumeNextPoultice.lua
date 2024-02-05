local poultices = {
    "mending",
    "mass",
    "restoration",
    "caloric",
    "epidermal",
}

local currentIndex = 1

local function consumeNextPoultice()
    if currentIndex > #poultices then
        -- All poultices have been consumed
        return
    end

    local poultice = poultices[currentIndex]
    snd.send("fc consume " .. poultice)
    currentIndex = currentIndex + 1

    tempTimer(1, consumeNextPoultice) -- Wait for 0.5 seconds before consuming the next poultice
end

consumeNextPoultice() -- Start consuming the first poultice
