local pills = {
    "waterbreathing",
    "kawhepill",
    "acuity",
    "steroid",
    "stimulant",
    "coagulation",
    "thanatonin",
    "paste",
    "somnium",
    "ototoxin",
    "decongestant",
    "amaurosis",
    "depressant",
    "antipsychotic",
    "panacea",
    "euphoriant",
    "anabiotic",
    "opiate",
    "eucrasia",
}

local currentIndex = 1

local function buyNextPill()
    if currentIndex > #pills then
        -- All pills have been bought
        return
    end

    local pill = pills[currentIndex]
    snd.send("buy " .. matches[2] .. " " .. pill)
    currentIndex = currentIndex + 1

    tempTimer(1, buyNextPill) -- Wait for 0.5 seconds before buying the next pill
end

buyNextPill() -- Start buying the first pill
