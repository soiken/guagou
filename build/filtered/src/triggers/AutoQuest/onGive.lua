function onGive(matches)
    if currentQuest and currentQuest.steps[currentStep].type == "give" and matches[2] == currentQuest.steps[currentStep].item then
        currentStep = currentStep + 1
        if not currentQuest.steps[currentStep] then
            completeQuest()
        end
    end
end
