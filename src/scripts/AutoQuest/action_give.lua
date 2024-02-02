function action_give(item, npcId)
  send("give " .. item .. " to " .. npcId)
  checkGiveCompletion = function(event, arg)
    if arg:find("You hold no '"..item.."'") then
      advanceQuestStep()
      killAnonymousEventHandler(checkGiveCompletionHandler)
    end
  end
  checkGiveCompletionHandler = registerAnonymousEventHandler("sysDataSendRequest", "checkGiveCompletion")
end
