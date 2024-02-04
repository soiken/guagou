quests = {
    
    ARBOTHIA_BAKER_FISHERMAN = {
        name = "QUEST_ARBOTHIA_BAKER_FISHERMAN",
        area = "Arbothia",
        item1 = "flatbread",
        item2 = "fish",
        item3 = "pie",
        npc1Id = "61781",
        npc1Name = "Seviel the baker",
        npc2Id = "183331",
        npc2Name = "Gorwin",
        steps = {
            {action = "path", target = "Arbothia"}, -- Use "Arbothia" directly, not 'area'
            {action = "path", target = "15172"},
            {action = "greet", npcId = "61781"}, -- Use the npcId directly, not 'npc1Id'
            {action = "command", command = "3"},
            {action = "path", target = "15139"},
            {action = "give", item = "flatbread", npcId = "183331"}, -- Use the item and npcId directly, not 'item1' and 'npc2Id'
            {action = "path", target = "15172"},
            {action = "give", item = "fish", npcId = "183331"}, -- Use the item and npcId directly, not 'item2' and 'npc2Id'
            {action = "greet", npcId = "183331"}, -- Use the npcId directly, not 'npc2Id'
            {action = "command", command = "1"},
            {action = "path", target = "15139"},
            {action = "give", item = "pie", npcId = "61781"} -- Use the item and npcId directly, not 'item3' and 'npc1Id'
        }
    },
    ALAQSII_ANIMALS = {
        name = "QUEST_ALAQSII_ANIMALS",
        area = "Alaqsii",
        item = "animal",
        npcId = "163721",
        npcName = "a hunter clad in furs", -- Missing comma
        steps = {
            {action = "path", target = "Alaqsii"}, -- Use "Alaqsii" directly, not 'area'
            {action = "kill"},
            {action = "search_npc", npcName = "a hunter clad in furs", area = "Alaqsii"}, -- Use the name directly, not 'npcName' and 'area'
            {action = "give", item = "animal", npcId = "163721"} -- Use the item and npcId directly, not 'item' and 'npcId'
        }
    }
    -- Add other quests here
}

currentQuest = nil
currentStep = 1
