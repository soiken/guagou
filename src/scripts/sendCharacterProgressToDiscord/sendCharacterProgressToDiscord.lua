local http = require("socket.http")
local ltn12 = require("ltn12")

-- Discord webhook URL
local webhook_url = "https://discord.com/api/webhooks/1205329064416641074/ore8ruGAnYVwWr5uGwjoGaAOkYz9R7OyXPowVhidqzVTQ6iaTWJmu5MSn5V7PfmMAwBh"

-- Function to send message to Discord
function sendMessageToDiscord(message)
    local payload = '{"content":"' .. message .. '"}'
    local response_body = {}
    local res, code, response_headers = http.request {
        url = webhook_url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = payload:len()
        },
        source = ltn12.source.string(payload),
        sink = ltn12.sink.table(response_body)
    }
end

-- Function to get the character name
function getCharacterName()
    local characterName = "Unknown"
    if gmcp.Char and gmcp.Char.Name and gmcp.Char.Name.name then
        characterName = gmcp.Char.Name.name
    end
    return characterName
end

-- Function to collect and format information from ProgressDisplay
function collectProgressInfo()
    local info = ""
    if ProgressDisplay then
        info = info .. ProgressDisplay.console:getText()
    end
    return info
end

-- Main function to send character name and progress info to Discord
function sendCharacterProgressToDiscord()
    local characterName = getCharacterName()
    local progressInfo = collectProgressInfo()
    local message = characterName .. "\n" .. progressInfo
    sendMessageToDiscord(message)
end

-- Call the main function to send character progress to Discord
sendCharacterProgressToDiscord()
