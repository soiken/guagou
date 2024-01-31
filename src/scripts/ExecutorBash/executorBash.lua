function snd.executor_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
    
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif hasSkill("Phlebotomise") then
    battack = "ringblade dance "..snd.bashing.target.." phlebotomise inveigle"
  elseif hasSkill("Gambit") then
    battack = "ringblade dance "..snd.bashing.target.." gambit inveigle"
  elseif hasSkill("Inveigle") then
    battack = "ringblade dance "..snd.bashing.target.." ploy inveigle"
  elseif hasSkill("Ploy") then
    battack = "ringblade dance "..snd.bashing.target.." ploy beguile"
  else
    battack = "ringblade dance "..snd.bashing.target.." contrive beguile"
  end
end