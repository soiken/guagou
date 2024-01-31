quests = {
  ALAQSII_ANIMALS = {
      name = "QUEST_ALAQSII_ANIMALS"
      area = "ALAQSII",
      steps = {
          {action = "PATH TRACK ALAQSII", type = "path"},
          {action = "snd_bashArea()", type = "kill"},
          {action = "give corpses to hunter", type = "give", item = "corpses"}
      }
  },
  ARBOTHIA_BAKER_FISHERMAN = {
    name = "QUEST_ARBOTHIA_BAKER_FISHERMAN"
      area = "ARBOTHIA",
      steps = {
          {action = "PATH TRACK ARBOTHIA", type = "path"},
          {action = "demonwalker:init()", type = "search_npc", npc = "Seviel"},
          {action = "greet Seviel", type = "interact"},
          {action = "demonwalker:init()", type = "search_npc", npc = "Gorwin"},
          {action = "give flatbread to Gorwin", type = "give", item = "flatbread"},
          {action = "demonwalker:init()", type = "search_npc", npc = "Seviel"},
          {action = "give fish to Seviel", type = "give", item = "fish"}
      }
  },
  -- Add other quests here
}

currentQuest = nil
currentStep = 1
