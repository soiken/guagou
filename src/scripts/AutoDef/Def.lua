echo("Initialization\n")

local commands = {
    "envenom weapon with darkshade",
    "touch Cloak",
    "touch Chameleon Lolita",
    "touch Starburst",
    "touch Flame",
    "touch Feather",
    "touch starburst",
    "touch Bell",
    "touch ring",
    "touch bracelet",
    "touch necklace",
    "touch chainmail",
    "fabricate brutaliser",
    "PATH TRACK 14395",
    expandAlias("buypills 10"),
    expandAlias("fillcache 30 venoms"),
    expandAlias("fillcache 30 poultices"),
    expandAlias("fillcache 30 elixirs"),
    "PATH TRACK 14507",
    expandAlias("fillcache 30 venoms"),
    expandAlias("fillcache 30 poultices"),
    expandAlias("fillcache 30 elixirs"),
    "PATH TRACK 12668",
    "buy 1 design19116",
    "buy 1 bandage",
    "PATH TRACK 12678",
    expandAlias("fillcache 30 venoms"),
    expandAlias("fillcache 30 poultices"),
    expandAlias("fillcache 30 elixirs"),
    "buypills 10",
    "PATH TRACK 13032",
    "buy 10 reishi",
    "put reishi in pipe",
    "light pipe",
    "smoke pipe",
    "dodge all",
    "mount brutaliser",
    "fabricate Eviscerator",
    "PATH TRACK 14393",
    expandAlias("fillcache 30 venoms"),
    expandAlias("fillcache 30 poultices"),
    expandAlias("fillcache 30 elixirs"),
    "BUY RECHARGE OF resistance on ring",
    "BUY RECHARGE OF cold on ring",
    "BUY RECHARGE OF electric on ring",
    "BUY RECHARGE OF fire on ring",
    "BUY RECHARGE OF allsight on necklace",
    "BUY RECHARGE OF waterwalking on bracelet",
    "PATH TRACK 22627",
    expandAlias("fillcache 30 venoms"),
    expandAlias("fillcache 30 poultices"),
    expandAlias("fillcache 30 elixirs"),
    "BUY RECHARGE OF purity on chainmail",
    expandAlias("fillvials"),
    expandAlias("unfillvials"),
    expandAlias("fillbandages"),
    expandAlias("unfillbandages"),
    expandAlias("unfillpills"),
    "lithe on",
    "coagulation on",
    "inspirited on",
    "efficiency on",
    "somersault on",
    "fabricate Rimestalker",
    "hide",
    "PATH TRACK 35199",
    "REMOVE GAUNTLET",
    "GIVE GAUNTLET TO BARAKIN",
    "WEAR GAUNTLET"
}


-- Variable to track whether the automation is running or stopped
local automationRunning = false

-- Variable to store the "PATH TRACK" command and its target number
local pathTrackCommand = nil
local pathTrackTargetNum = nil

-- Function to send the next command in the list
-- Function to send the next command in the list
function sendNextCommand()
    if #commands == 0 then
        automationRunning = false
        cecho("<red>Automation completed. No more commands to execute.<reset>\n")
        snd.runPath("custom")
        return
    end

    if not automationRunning then
        cecho("<red>Automation stopped or not started.<reset>\n")
        return
    end

    local command = table.remove(commands, 1) -- Get the next command from the list

    if string.match(command, "expandAlias") then
        send(expandAlias(command))
    else
        if string.match(command, "PATH TRACK") then
            pathTrackCommand = command
            pathTrackTargetNum = tonumber(string.match(command, "%d+")) -- Extract the target room number
            send(command) -- Send the "PATH TRACK" command immediately
            cecho("<green>Sending PATH TRACK: " .. command .. "<reset>\n")
            tempTimer(1.5, checkPathTrack)
        else
            send(command) -- Send non-"PATH TRACK" command immediately
            cecho("<green>Sending: " .. command .. "<reset>\n")
            tempTimer(3, sendNextCommand) -- Wait for 3 seconds before sending the next command
        end
    end
end


-- Function to check if the current room matches the target room number
function checkPathTrack()
    if not pathTrackCommand then
        sendNextCommand()
        return
    end

    local currentNum = gmcp.Room.Info.num -- Get the current room number from GMCP
    if currentNum == pathTrackTargetNum then
        pathTrackCommand = nil -- Reset the pathTrackCommand variable
        sendNextCommand() -- Proceed to send the next command
    else
        tempTimer(1, checkPathTrack) -- Wait for 1 second and then check again
        cecho("<yellow>Waiting for room match. Current: " .. currentNum .. ", Target: " .. pathTrackTargetNum .. "<reset>\n")
    end
end

-- Function to start the automation
function run_nekiosdef()
    if automationRunning then
        cecho("<yellow>Automation is already running.<reset>\n")
        return
    end

    automationRunning = true
    cecho("<green>Automation started.<reset>\n")
    sendNextCommand() -- Start sending commands
end

-- Function to stop the automation
function stop_nekiosdef()
    automationRunning = false -- Stop the automation
    cecho("<red>Automation stopped.<reset>\n")
end

-- Initialize the GMCP module (if not already done in another part of your script)
if not gmcp then
    enableGMCP()
end