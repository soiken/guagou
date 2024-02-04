function action_give(item, npcId)
  local retries = 0 -- Track the number of retries for finding the NPC
  
  local function attemptGive()
      send("give " .. item .. " to " .. npcId)
  end

  local function checkGiveCompletion(event, arg)
      if arg:find("You hold no '"..item.."'") then
          -- Successfully given all instances of the item, advance to the next step
          echo("All '" .. item .. "' given to NPC " .. npcId .. ".\n")
          advanceQuestStep()
          killAnonymousEventHandler(checkGiveCompletionHandler)
      elseif arg:find("You can find no such target as '"..npcId.."'") then
          -- NPC not found, retry after a delay
          if retries < 1 then -- Allows for 1 retry
              echo("NPC " .. npcId .. " not found, retrying in 5 seconds.\n")
              retries = retries + 1
              tempTimer(5, attemptGive) -- Retry after 5 seconds
          else
              -- Skip the step if the NPC is still not found after the retry
              echo("NPC with ID " .. npcId .. " not found after retry. Skipping step.\n")
              advanceQuestStep()
              killAnonymousEventHandler(checkGiveCompletionHandler)
          end
      else
          -- If the NPC is found and no message about lacking the item, try giving again immediately
          tempTimer(0.5, attemptGive) -- Short delay before retrying to avoid spamming
      end
  end

  -- Initial attempt to give the item
  attemptGive()
  -- Register the event handler to check the command's outcome
  checkGiveCompletionHandler = registerAnonymousEventHandler("sysDataSendRequest", "checkGiveCompletion")
end
