-- Function to find the next quest key based on the current quest key
function findNextQuestKey(currentKey)
  local keys = {}
  for k in pairs(quests) do table.insert(keys, k) end
  table.sort(keys) -- Ensure the keys are in a predictable order if necessary

  for i, key in ipairs(keys) do
      if key == currentKey then
          return keys[i + 1] -- Return the next key in the list
      end
  end
  return nil -- Return nil if there are no more quests
end

-- Modified advanceQuestStep to automatically start the next quest
function advanceQuestStep()
  currentStep = currentStep + 1
  if currentStep > #quests[currentQuest].steps then
      echo("Quest completed: " .. quests[currentQuest].name .. "\n")

      -- Attempt to find and start the next quest
      local nextQuestKey = findNextQuestKey(currentQuest)
      if nextQuestKey then
          -- Start the next quest
          echo("Starting next quest: " .. quests[nextQuestKey].name .. "\n")
          currentQuest = nextQuestKey
          currentStep = 1
          executeCurrentStep()
      else
          -- No next quest found, reset current quest and step
          echo("No more quests to complete.\n")
          currentQuest = nil
          currentStep = 1
      end
  else
      executeCurrentStep()
  end
end
