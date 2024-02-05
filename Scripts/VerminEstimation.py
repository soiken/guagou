# Constants
total_time = 36000  # Total available time in seconds (10 hours)
transition_time = 0.5  # Time to move between rooms in seconds
vermin_per_hour = 3  # Maximum vermin appearances per room per hour
hour_in_seconds = 3600  # Number of seconds in an hour

# Stay durations to evaluate, in seconds
stay_durations = [1, 5, 10, 15, 30, 60, 120]

# Function to calculate rooms visited and expected vermin encounters
def calculate_metrics(stay_duration):
    # Calculate the total time per room visit, including transition
    total_time_per_visit = stay_duration + transition_time
    # Calculate the number of rooms visited
    rooms_visited = total_time / total_time_per_visit
    # Estimate expected vermin encounters based on stay duration
    expected_vermin_per_visit = min((stay_duration / hour_in_seconds) * vermin_per_hour, vermin_per_hour)
    # Total expected vermin encounters
    total_expected_vermin = rooms_visited * expected_vermin_per_visit
    return rooms_visited, total_expected_vermin

# Calculate and store results for each stay duration
results = {duration: calculate_metrics(duration) for duration in stay_durations}

results



Timer (run this every 13 seconds)

-- Call this function when you enter a new room or after moving to the next room
function setupRoomTimer()
  if snd.verminCount < 3 then
    -- Set a timer for 13 seconds to move to the next room
    tempTimer(13, function()
      snd.move() -- Your function to move to the next room
      snd.verminCount = 0 -- Reset the count for the new room
    end)
  end
end

-- Ensure this is called each time you enter a new room
setupRoomTimer()


New Script

-- Initialize variables if not already set
snd.verminCount = snd.verminCount or 0
snd.lastVerminTime = snd.lastVerminTime or os.time()
snd.spawnRates = snd.spawnRates or {}

-- Function to update spawn rate tracking
function updateSpawnRate()
  local currentTime = os.time()
  local timeSinceLastVermin = currentTime - snd.lastVerminTime
  table.insert(snd.spawnRates, timeSinceLastVermin)
  snd.lastVerminTime = currentTime
  
  -- Calculate the average spawn rate if we have enough data
  if #snd.spawnRates > 3 then -- Using 3 for basic trend analysis, adjust as needed
    local sum = 0
    for _, duration in ipairs(snd.spawnRates) do
      sum = sum + duration
    end
    local averageSpawnRate = sum / #snd.spawnRates
    adjustMovementStrategy(averageSpawnRate)
  end
end

-- Function to adjust movement based on observed spawn rate
function adjustMovementStrategy(averageSpawnRate)
  -- Here you can define how to adjust your strategy based on the average spawn rate.
  -- For simplicity, this example will just print the adjustment plan.
  print("Adjusting strategy based on average spawn rate of: " .. averageSpawnRate .. " seconds")
  
  -- Example: If vermin spawn quickly, consider staying shorter. If slow, consider the full duration.
  if averageSpawnRate < 30 then
    -- Vermin spawn quickly, adjust timer for shorter stays if it's significantly faster than our current strategy
    setupRoomTimer(math.max(5, averageSpawnRate)) -- Stay at least 5 seconds
  else
    -- Vermin spawn slowly, stick to the standard strategy (e.g., 13 seconds)
    setupRoomTimer(13)
  end
end

-- Timer setup function with dynamic stay duration
function setupRoomTimer(stayDuration)
  stayDuration = stayDuration or 13 -- Default to 13 seconds if not specified
  if snd.roomTimer then killTimer(snd.roomTimer) end -- Reset the timer if it exists
  snd.roomTimer = tempTimer(stayDuration, function()
    snd.move()
    snd.verminCount = 0
    -- Reset tracking for the new room
    snd.lastVerminTime = os.time()
    snd.spawnRates = {}
  end)
end

-- Vermin encounter logic
if snd.toggles.vermin then
  if snd.toggles.newbie then
    send("k vermin")
  else
    -- Your existing attack logic
  end
  snd.verminCount = snd.verminCount + 1
  updateSpawnRate() -- Update spawn rate tracking with each vermin encounter
  
  -- Immediate move if 3 vermin have been defeated
  if snd.verminCount >= 3 then
    snd.move()
    snd.verminCount = 0
    snd.lastVerminTime = os.time() -- Reset for the new room
    snd.spawnRates = {}
  end
end

