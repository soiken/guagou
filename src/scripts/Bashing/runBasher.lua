local function getTarget(tab)
    for _, targ in pairs(table.n_union(snd.possible_targets, snd.global_targets)) do
      if targ:sub(1,6) == "Match:" then
        local pattern = targ:sub(7):lower()
        for name, ids in pairs(tab) do
          if name:lower():find(pattern) and tab[name][1] then
            return tab[name][1], name
          end
        end
      elseif tab[targ] and tab[targ][1] then
        return tab[targ][1], targ
      end
    end
  end