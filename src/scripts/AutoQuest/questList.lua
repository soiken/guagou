quests = {
    ALAQSII_ANIMALS = {
        name = "QUEST_ALAQSII_ANIMALS",
        area = "Alaqsii",
        item = "animal",
        npcId = "163721",
        npcName = "a hunter clad in furs"
        steps = {
            {action = "path", target = area},
            {action = "kill"},
            {action = "search_npc", npcName = npcName, area = area},
            {action = "give", item = item, npcId = npcId}
        }
    },
    ARBOTHIA_BAKER_FISHERMAN = {
      name = "QUEST_ARBOTHIA_BAKER_FISHERMAN",
      area = "Arbothia",
      item1 = "flatbread",
      item2 = "fish",
      item3 = "pie",
      npc1Id = "61781",
      npc1Name = "Seviel",
      npc2Id = "183331",
      npc2Name = "Gorwin"
        steps = {
            {action = "path", target = area},
            {action = "path", target = "15172"},
            {action = "greet", npcId = npc1Id},
            {action = "command", command = "3"},
            {action = "path", target = "15139"},
            {action = "give", item = item1, npcId = npc2Id},
            {action = "path", target = "15172"},
            {action = "give", item = item2, npcId = npc2Id},
            {action = "greet", npcId = npc2Id},
            {action = "command", command = "1"},
            {action = "path", target = "15139"},
            {action = "give", item = item3, npcId = npc1Id}
  
        }
    },
    -- Add other quests here
  }
  
  currentQuest = nil
  currentStep = 1