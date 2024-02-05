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

local function consumeNextPill()
    if currentIndex > #pills then
        -- All pills have been bought
        return
    end

    local pill = pills[currentIndex]
    snd.send("eat " .. matches[2] .. " " .. pill)
    currentIndex = currentIndex + 1

    tempTimer(0.5, consumeNextPill) -- Wait for 0.5 seconds before buying the next pill
end

consumeNextPill() -- Start buying the first pill