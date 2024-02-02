PATH TRACK ALAQSII
arrived (check area)
snd_bashArea()
done
will return to spinesreach
arrived (check area)
mpp
path track ALAQSII
arrived (check area)
lua gmcp.Char.Items.Update
lua gmcp.Char.Items.List 
find [163721] a hunter clad in furs
give corpses to hunter
You hold no 'animal'
You can find no such target as 'lolita'.
You can find no such target as '183331'.

I have a quest list for the game aetolia that I play on mudlet and I want to go through the quest list automatically when I type "nekiosquest", help me prepare all the triggers, aliases and scripts for mudlet

Here is an example of my quest list:

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
          {action = "give", item, npcId}
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
          {action = "greet", npc1Id},
          {action = "command", "3"},
          {action = "path", "15139"},
          {action = "give", item1, npc2Id},
          {action = "path", "15172"},
          {action = "give", item2, npc2Id},
          {action = "greet", npc2Id},
          {action = "command", "1"},
          {action = "path", "15139"},
          {action = "give", item3, npc1Id}

      }
  },
  -- Add other quests here
}

currentQuest = nil
currentStep = 1


I need a function for each type of action in each quest
the action will be performed in order, and there should be checkings for each action being completed before moving on to the next

1. action = path 
this action require the character to go to specific area
which can be done by sending the command "PATH TRACK (area)" or "PATH TRACK (roomId)", if the action uses area then send area, if the action uses roomId then send the roomId
current area can be tracked by calling the function "gmcp.Room.Info.area" 
current roomId can be tracked by calling the function "gmcp.Room.Info.num"
if the specified area partially match "gmcp.Room.Info.area" for "PATH TRACK (area)" then the character has arrvied and can move onto the next action. 
if the specified roomId partially match "gmcp.Room.Info.num" for "PATH TRACK (roomId)" then the character has arrvied and can move onto the next action. 

2. action = kill
this action require the character to kill mobs in the area to finish the quest
which can be done by using the function "snd_bashArea()" which will kill all mobs in the area and then walk back to "spinesreach"
therefore you could check if "gmcp.Room.Info.area" is "spinesreach" after kill action is sent, and when area is back at "spinesreach", move onto the next action.

3. action = search_npc
this action is looking for a specific npc in the game to interact with
which can be done by using the function "mobDB.lookupArea(area)" and it will return an array of npcs and its respective roomId, for example:

Here is an example of "mobDB.lookupArea("spinesreach")":

{ {
    mobs = { {
        name = "Archivist Ghada",
        roomId = 44585
      }, {
        name = "Assistant Engineer Burkhart Straton",
        roomId = 11687
      }, {
        name = "Bakir, a soft-spoken Xorani",
        roomId = 12809
      }, {
        name = "Brangrin, Warden of the Wintersbreeze",
        roomId = 11933
      }},
    name = "Spinesreach"
  } }

then "PATH TRACK (roomId)" to go to the npc, check "gmcp.Room.Info.num" = (roomId) if it matches, move onto the next action.

4. action = give
this action gives the quest item to the npc by sending the command "give (item) to (npcid)"
keep sending this give command since the character might hold more than 1, until it sees "You hold no '(item)'", move onto the next action.

5. action = greet
this action interacts with the npc by sending "greet (npcId)"

6. action = command
this action sends the command specified in the action, for example {action = "command", "3"} will send 3 on mudlet.
