# Constants
total_seconds = 10 * 60 * 60  # 10 hours in seconds
transition_time = 0.5  # Time to move between rooms in seconds

# Scenarios: Stay durations in seconds (excluding the extreme of infinite waiting)
stay_durations = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]  # Different fixed intervals to evaluate

# Calculate expected gain for different stay durations
def calculate_visits_and_time(stay_duration, total_seconds, transition_time):
    total_time_per_room = stay_duration + transition_time
    total_visits = total_seconds / total_time_per_room
    return total_visits, total_visits * total_time_per_room

# Evaluate each scenario
results = {stay_duration: calculate_visits_and_time(stay_duration, total_seconds, transition_time) for stay_duration in stay_durations}

print(results)


1: (24000.0, 36000.0
2: (14400.0, 36000.0
3: (10285.714285714286, 36000.0
4: (8000.0, 36000.0
5: (6545.454545454545, 36000.0
6: (5538.461538461538, 36000.0
7: (4800.0, 36000.0
8: (4235.294117647059, 36000.0
9: (3789.4736842105262, 36000.0
10: (3428.5714285714284, 36000.0
11: (3130.4347826086955, 36000.0
12: (2880.0, 36000.0
13: (2666.6666666666665, 36000.0
14: (2482.7586206896553, 36000.0
15: (2322.5806451612902, 36000.0
16: (2181.818181818182, 36000.0
17: (2057.1428571428573, 36000.0
18: (1945.945945945946, 36000.0
19: (1846.1538461538462, 36000.0
20: (1756.0975609756097, 36000.0
21: (1674.4186046511627, 36000.0
22: (1600.0, 36000.0
23: (1531.9148936170213, 36000.0
24: (1469.3877551020407, 36000.0
25: (1411.764705882353, 36000.0
26: (1358.4905660377358, 36000.0
27: (1309.090909090909, 36000.0
28: (1263.157894736842, 36000.0
29: (1220.3389830508474, 36000.0
30: (1180.327868852459, 36000.0)}