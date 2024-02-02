function advanceQuestStep()
  -- Increment the current step index
  currentStep = currentStep + 1

  -- Check if the current quest is complete
  if currentStep > #quests[currentQuest].steps then
    -- Quest completion logic
    echo("Quest " .. quests[currentQuest].name .. " completed!\n")
    -- Reset or move to the next quest as needed
    currentQuest = nil
    currentStep = 1
    -- Optionally, start a new quest or perform some action after quest completion
  else
    -- Execute the next step in the current quest
    executeCurrentStep()
  end
end
