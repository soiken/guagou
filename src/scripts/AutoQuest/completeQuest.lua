function completeQuest(questName)
    if currentQuest and questName == currentQuest.name then
        echo("Quest " .. questName .. " completed!")
        currentQuest = nil
        currentStep = 1
        -- Optionally trigger the next quest or some other action
    end
end
