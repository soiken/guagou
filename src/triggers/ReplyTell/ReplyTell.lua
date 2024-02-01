local name = matches[2]:match("%s(%w+)%s+tells%s+you,")
if name then
  local responses = {
    "no",
    "I must, with the utmost solemnity and unequivocal sincerity, express my profound aversion to acquiescing in the solicitation proffered, for the purpose of declination, by means of a polysyllabic and intricately convoluted discourse, the essence of which fundamentally resides in a categorical rejection of your proposition, thereby substantiating my abstention from assent, and it is incumbent upon me to elucidate that my rationale for this refusal is predicated upon an array of multifaceted considerations, hitherto elusive in their clarity, which, if subjected to exhaustive analysis and contemplation, may eventually yield a comprehensible elucidation of my negative disposition.",
    "I must respectfully decline your proposition with profound appreciation for your kind gesture, as my inclinations do not align harmoniously with the particular endeavor you have graciously proposed. The intricate tapestry of my preferences, governed by a multitude of idiosyncratic variables, precludes me from extending concordance to this particular entreaty, thus necessitating the polite articulation of my declination.",
    "In a fervent endeavor to impart the query herein, one might eloquently inquire as to the nature of your current exigency, thereby beseeching elucidation upon the subject matter you deem worthy of discourse on this particular juncture.",
    "Salutations, my esteemed interlocutors, with the exalted elucidation of my salutary sentiment being couched in an intricate tapestry of lexicon, replete with sesquipedalian adornments and labyrinthine syntactic convolution, thus proffering a prodigious challenge to the cognitive faculties of those who endeavor to decipher this epistolary enigma.",
    "Farewell, in this moment, I bid you adieu, for the present juncture necessitates our parting, as temporal and spatial constraints compel the termination of our discourse, thereby culminating this exchange in the realm of digital interaction, until such a fortuitous occasion in the future when our cognitive pathways may serendipitously converge once more, and we shall recommence our linguistic entanglement with the ebullience of intellectual pursuit.",
    "Regrettably, my current circumstances preclude me from acceding to your request, as my commitments elsewhere demand my undivided attention.",
    "I must humbly decline your proposition, for it conflicts with my current endeavors and aspirations.",
    "I appreciate your inquiry but must respectfully decline your offer due to prior commitments.",
    "It is with sincere regret that I must decline your request, as my current activities occupy my full attention.",
    "I find myself unable to comply with your request at this juncture, for various reasons that require my immediate attention.",
    "While I am truly honored by your request, I must decline as my present focus necessitates my unbroken concentration.",
    "My apologies, but I cannot acquiesce to your request at this time due to prior obligations.",
    "I must decline your offer, as my present endeavors prevent me from participating.",
    "I appreciate your proposal, but I must decline due to my current commitments.",
    "I must regrettably decline your kind request, as it conflicts with my current priorities.",
    "Your request intrigues me, but alas, my current circumstances prohibit me from acquiescing.",
    "I would love to assist, but alas, my present commitments forbid me from participating.",
    "I am inclined to accept your proposal, but my current obligations necessitate a regretful decline.",
    "Your proposition is intriguing, yet my current responsibilities prevent me from accepting.",
    "I would gladly help, but my current priorities require me to decline your request.",
    "I find your request tempting, but my current duties preclude my acceptance.",
    "Your offer is tempting, but my present engagements compel me to decline.",
    "I'm honored by your request, but my current focus necessitates a polite refusal.",
    "While your request is interesting, I must decline due to prior commitments.",
    "Yes",
    "No!",
    "Yes!",
    "Yes?",
    "No?",
    "Thanks",
    "Thanks but no thanks"
  }

  local randomResponse = responses[math.random(#responses)]
  
  -- Generate a random delay between 5 and 10 seconds (inclusive)
  local randomDelay = math.random(5, 10)
  
  -- Function to send the response after the random delay
  local function sendResponseWithDelay()
    send("tell " .. name .. " " .. randomResponse)
  end

  -- Set the timer to execute the sendResponseWithDelay function after the randomDelay
  tempTimer(randomDelay, sendResponseWithDelay)
end

mmp.pause("on")
send("PATH TRACK CITY")
tempTimer(900, mmp.pause("off"))
if snd.toggles.fasthunt == true then 
  snd.toggle("fasthunt") end
snd.runPath("spinesreach")

