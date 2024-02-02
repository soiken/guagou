function action_kill()
  snd_bashArea() -- Assuming this function kills all mobs and returns to Spinesreach
  checkKillCompletion = function()
    if gmcp.Room.Info.area == "Spinesreach" then
      advanceQuestStep()
    end
  end
  registerAnonymousEventHandler("gmcp.Room.Info", "checkKillCompletion")
end