function checkQuestProgress()
    -- Check if there is a current quest
    if currentQuest and quests[currentQuest] and currentStep then
      local quest = quests[currentQuest]
      local step = quest.steps[currentStep]
      local progressMsg = string.format("Current Quest: %s\nStep: %d/%d\nAction: %s",
                                        quest.name, currentStep, #quest.steps, step.action)
      -- Additional details can be added here depending on the step's action and parameters
      echo(progressMsg)
    else
      echo("No quest is currently in progress.\n")
    end
  end
  