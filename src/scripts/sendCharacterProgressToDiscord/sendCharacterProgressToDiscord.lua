function sendToDiscordWebhook(discord_username, avatarurl, message)
    local characterName = getCharacterName()
    local progressData, inventoryData = "", ""

    -- Format experience and gold log data with emojis and Markdown for styling
    local totalExp = 0
    for _, expLog in ipairs(ProgressDisplay.expLog) do
        totalExp = totalExp + expLog.amount
    end
    local totalGold = 0
    for _, goldLog in ipairs(ProgressDisplay.goldLog) do
        totalGold = totalGold + goldLog.amount
    end
    progressData = "**Experience Gained:** 🌟 " .. totalExp .. "\n**Gold Acquired:** 💰 " .. totalGold

    -- Format inventory data with bullets
    local sortedItems = {}
    for id, item in pairs(inv) do
        table.insert(sortedItems, {name = item.name, id = id})
    end
    table.sort(sortedItems, function(a, b) return a.name < b.name end)
    for _, item in ipairs(sortedItems) do
        inventoryData = inventoryData .. "\n• " .. item.name
    end
    if inventoryData == "" then inventoryData = "*Inventory is empty* 😕" else inventoryData = "**Inventory Items:**\n" .. inventoryData end

    -- Combine all data into the message content with a greeting and character name styled
    local message = "🎮 **Character Progress Update for " .. characterName .. "** 🎮\n\n" .. progressData --.. "\n\n" .. inventoryData

    local url = "https://discord.com/api/webhooks/1205329064416641074/ore8ruGAnYVwWr5uGwjoGaAOkYz9R7OyXPowVhidqzVTQ6iaTWJmu5MSn5V7PfmMAwBh"
    local data = {
        username = discord_username, 
        avatar_url = avatarurl,
        content = message
    }
    local header = {
        ["Content-Type"] = "application/json",
    }
  
    local success, errorMessage = pcall(postHTTP, yajl.to_string(data), url, header)
    if not success then
        cecho("<red>Error sending message to Discord: " .. errorMessage .. "\n")
    else
        cecho("<green>Message sent to Discord successfully. 🚀\n")
    end
end
