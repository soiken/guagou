function startQuest(questName)
    if quests[questName] then
        currentQuest = quests[questName]
        execute(currentQuest.actions[1].command)
    else
        echo("Quest not found!")
    end
end
