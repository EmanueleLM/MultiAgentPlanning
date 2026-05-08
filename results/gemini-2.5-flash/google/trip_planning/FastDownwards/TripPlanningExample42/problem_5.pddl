(define (problem trip_planning_problem_42)
  (:domain trip_planning_example_42)
  (:objects
    traveler - person
    city_paris city_nice city_mykonos - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - time
  )
  (:init
    (current_time day1)
    (at traveler city_paris day1) ; Assuming start in Paris to facilitate early friend meeting

    (connected city_paris city_nice)
    (connected city_nice city_paris)
    (connected city_nice city_mykonos)
    (connected city_mykonos city_nice)

    ; Define the sequence of time steps for 11 days
    (next_time day1 day2)
    (next_time day2 day3)
    (next_time day3 day4)
    (next_time day4 day5)
    (next_time day5 day6)
    (next_time day6 day7)
    (next_time day7 day8)
    (next_time day8 day9)
    (next_time day9 day10)
    (next_time day10 day11)

    ; Initial state for city stay counters
    (visited_paris_day_0)
    (visited_mykonos_day_0)
    (visited_nice_day_0)
  )
  (:goal (and
    (visited_paris_day_4)
    (visited_mykonos_day_4)
    (visited_nice_day_5)
    (friends_met_in_paris)
  ))
  (:metric minimize (total-cost))
)