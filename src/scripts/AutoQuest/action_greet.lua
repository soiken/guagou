function action_greet(npcId)
  send("greet " .. npcId)
  advanceQuestStep()
end