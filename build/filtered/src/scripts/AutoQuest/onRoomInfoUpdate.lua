function onRoomInfoUpdate()
    if not gmcp.Room.Info or not currentQuest then
        return
    end

    local currentArea = string.upper(gmcp.Room.Info.area)
    if currentQuest.area == currentArea then
        currentStep = currentStep + 1
        if currentQuest.steps[currentStep] then
            send(currentQuest.steps[currentStep].action)
        else
            completeQuest()
        end
    end
end

registerAnonymousEventHandler("gmcp.Room.Info", "onRoomInfoUpdate")
