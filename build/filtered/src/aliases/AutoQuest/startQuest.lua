function startQuest(name)
    if quests[name] then
        currentQuest = quests[name]
        currentStep = 1
        send(currentQuest.steps[currentStep].action)
    else
        echo("Quest not found.")
    end
end
