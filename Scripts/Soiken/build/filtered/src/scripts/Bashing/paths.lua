snd.paths = snd.paths or {}
snd.paths.high = {
  "Luzith's Lair",
  "Tiyen Esityi",
  "Dovan Hollow",
  "Xaanhal",
  "Spiral of the Corrupt",
  "Forgotten Dome",
  "Nal'jin Depths",
  "the Squal",
}
snd.paths.low = {
  "Temple of Sonn",
  "Caverns of Mor",
  "a Snake Pit",
  "Saliltul Swamp",
  "Sparklight Rift",
  "Maghuir Fissure",
  "Kalydian Forest",
  "Ayhesa Cliffs",
  "Fractal Bloom",
  "Three Rock Outpost",
  "Augerweald",
  "Mamashi Tunnels",
  "Isle of Ollin",
  "The Torturers' Caverns",
  "Drakuum",
  "Teshen Caldera",
}
snd.paths.duiran = {
  "duiran"
}
snd.paths.spinesreach = {
  "spinesreach"
}
snd.paths.bloodloch = {
  "bloodloch"
}
function snd.runPath(pathname)
  pathname = string.lower(pathname)
  if not snd.paths[pathname] then
    snd.message(pathname.." is not a valid path. Options: "..table.concat(table.keys(snd.paths), ", "))
    return
  end
  snd.message("Now running: "..pathname)
  snd_bashAreas(table.concat(snd.paths[pathname], ", "):lower())
end
