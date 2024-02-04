-- Define a timer interval (in seconds) for refreshing the quest progress
local refreshInterval = 5  -- Adjust this value as needed

-- Function to check and display quest progress
function checkQuestProgress()
  local questConsole = Geyser.MiniConsole:new({
    name = "Quest Progress Console",
    height = "20%",
    width = "20%",
    y = "80%",
    x = "80%",
    color = "black",
  })

  local function displayProgress()
    -- Check if there is a current quest
    if currentQuest and quests[currentQuest] and currentStep then
      local quest = quests[currentQuest]
      local step = quest.steps[currentStep]
      local progressMsg = string.format("<green>Current Quest: %s\nStep: %d/%d\nAction: %s<reset>",
                                        quest.name, currentStep, #quest.steps, step.action)
      -- Additional details can be added here depending on the step's action and parameters
      questConsole:clear()
      questConsole:cecho(progressMsg .. "\n")
    else
      questConsole:clear()
      questConsole:cecho("<red>No quest is currently in progress.\n<reset>")
    end
  end

  -- Set up a timer to periodically refresh the quest progress
  tempTimer(refreshInterval, "displayProgress", true)
  
  -- Display the progress immediately upon function call
  displayProgress()
end

-- Call checkQuestProgress() to initiate the display and refresh process
checkQuestProgress()
