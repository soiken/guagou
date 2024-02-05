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

if snd.toggles.vermin then
  if snd.toggles.newbie then
    send("k vermin")
  else
    -- Define your attack logic here
    snd.bashing.target = "vermin"
    -- Your attack commands and logic here
  end
  snd.verminCount = (snd.verminCount or 0) + 1 -- Initialize if nil and increment the vermin count
  -- Check if 3 vermin have been defeated to move immediately
  if snd.verminCount >= 3 then
    snd.move() -- Your function to move to the next room
    -- Reset vermin count for the new room
    snd.verminCount = 0
  end
end
