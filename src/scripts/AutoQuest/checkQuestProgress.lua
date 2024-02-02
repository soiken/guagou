-- Step 1: Create the miniConsole
local questConsoleName = "QuestProgressConsole"
if not exists(questConsoleName, "miniConsole") then
  createMiniConsole(questConsoleName, 0, 0, 300, 200) -- Adjust size and position as needed
  setMiniConsoleFontSize(questConsoleName, 10) -- Adjust font size as needed
end

-- Function to position the miniConsole. Adjust the coordinates and size as needed.
function positionQuestConsole()
  local mainConsoleWidth, mainConsoleHeight = getMainWindowSize()
  local consoleWidth = 300 -- Width of the miniConsole
  local consoleHeight = 200 -- Height of the miniConsole
  moveWindow(questConsoleName, mainConsoleWidth - consoleWidth - 30, mainConsoleHeight - consoleHeight - 30)
  resizeWindow(questConsoleName, consoleWidth, consoleHeight)
  setBackgroundColor(questConsoleName, 0, 0, 0, 0.8) -- Set background color and transparency
end
positionQuestConsole()

-- Step 2: Define a function to update the miniConsole with the quest progress
function updateQuestProgress()
  if currentQuest and quests[currentQuest] and currentStep then
    local quest = quests[currentQuest]
    local step = quest.steps[currentStep]
    local progressMsg = string.format("Current Quest: %s\nStep: %d/%d\nAction: %s",
                                      quest.name, currentStep, #quest.steps, step.action)
    -- Clear the existing content
    clearWindow(questConsoleName)
    -- Write the new progress information
    echo(questConsoleName, progressMsg .. "\n")
  else
    clearWindow(questConsoleName)
    echo(questConsoleName, "No quest is currently in progress.\n")
  end
end

-- Optional: Update the quest progress periodically or after specific actions
-- For example, you can call updateQuestProgress() at the end of your quest step execution function
