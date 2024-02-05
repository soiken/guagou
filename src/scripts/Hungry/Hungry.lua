local hungerCommands = {
  {num = 14510, commands = {"PATH TRACK 14510", "buy 5 design10848", "buy 5 design22415", "buy 5 design29058", "buy 5 design7251", "buy 5 design14723", "eat pie", "eat cup", "eat mousse", "eat plate", "eat pie"}},
  {num = 21061, commands = {"PATH TRACK 21061", "buy 5 snack458990", "buy 5 snack285951", "buy 5 design30165", "buy 5 design30166", "buy 5 design30167", "eat snack", "eat snack", "eat snack", "eat snack", "eat snack"}},
  {num = 14393, commands = {"PATH TRACK 14393", "buy 5 design25455", "buy 5 design26059", "buy 5 design30171", "buy 5 design30195", "buy 5 design3036", "eat snack", "eat snack", "eat snack", "eat snack", "eat cookie"}}
}

local currentHungerIndex = 1

function handleHunger()
  local roomNum = gmcp.Room.Info.num or 0
  while currentHungerIndex <= #hungerCommands do
      if roomNum == hungerCommands[currentHungerIndex].num then
          for _, command in ipairs(hungerCommands[currentHungerIndex].commands) do
              send(command)
          end
          currentHungerIndex = currentHungerIndex + 1
      else
          -- Break the loop if the room doesn't match
          break
      end
  end
  if currentHungerIndex > #hungerCommands then
      -- All commands have finished, you can reset the index or take further action
      currentHungerIndex = 1
  end
end
