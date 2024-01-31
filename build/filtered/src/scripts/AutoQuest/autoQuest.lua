function autoQuest()
    for questName, _ in pairs(quests) do
        startQuest(questName)
        repeat
            tempTimer(1, [[checkQuestCompletion()]]) -- Checks every second if the quest is complete
        until currentQuest == nil
    end
end
