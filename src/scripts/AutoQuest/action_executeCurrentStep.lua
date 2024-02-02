function executeCurrentStep()
  -- Ensure there is a current quest and step to execute
  if not currentQuest or not quests[currentQuest] or not quests[currentQuest].steps[currentStep] then
    echo("No current quest or step found to execute.\n")
    return
  end

  local step = quests[currentQuest].steps[currentStep]

  if step.action == "path" then
    -- Execute path action. Assumes step has a target area or roomId.
    action_path(step.target)
  elseif step.action == "kill" then
    -- Execute kill action. Assumes no additional parameters are needed.
    action_kill()
  elseif step.action == "search_npc" then
    -- Execute search NPC action. Assumes step provides npcName and possibly area.
    action_search_npc(step.npcName, step.area or quests[currentQuest].area)
  elseif step.action == "give" then
    -- Execute give action. Assumes step provides item and npcId.
    action_give(step.item, step.npcId)
  elseif step.action == "greet" then
    -- Execute greet action. Assumes step provides npcId.
    action_greet(step.npcId)
  elseif step.action == "command" then
    -- Execute command action. Assumes step provides the command to send.
    action_command(step.command)
  else
    echo("Unknown action: " .. (step.action or "nil") .. "\n")
  end
end
