quests = {
  ALAQSII_ANIMALS = {
      name = "QUEST_ALAQSII_ANIMALS",
      area = "Alaqsii",
      item = "animal",
      npcId = "163721",
      npcName = "Hunter"
      steps = {
          {action = "path"},
          {action = "kill"},
          {action = "search_npc", npcName},
          {action = "give", item}
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
          {action = "path", area},
          {action = "path", "15172"},
          {action = "greet", npc1Name},
          {action = "command", "3"},
          {action = "path", "15139"},
          {action = "give", item1, npc1Name},
          {action = "path", "15172"},
          {action = "give", item2, npc2Name},
          {action = "greet", npc1Name},
          {action = "command", "1"},
          {action = "path", "15139"},
          {action = "give", item3, npc1Name}

      }
  },
  -- Add other quests here
}

currentQuest = nil
currentStep = 1
