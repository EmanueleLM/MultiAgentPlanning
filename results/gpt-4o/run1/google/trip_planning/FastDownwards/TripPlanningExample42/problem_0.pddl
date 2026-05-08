(define (problem trip_plan_instance)
  (:domain trip_planning)
  
  (:objects
    paris nice mykonos - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  
  (:init
    (connected paris nice)
    (connected nice mykonos)
    
    (day_before day1 day2)
    (day_before day2 day3)
    (day_before day3 day4)
    (day_before day4 day5)
    (day_before day5 day6)
    (day_before day6 day7)
    (day_before day7 day8)
    (day_before day8 day9)
    (day_before day9 day10)
    (day_before day10 day11)

    (current_city paris day1)
    
    (meet_friends day1)
    (meet_friends day2)
    (meet_friends day3)
    (meet_friends day4)
  )
  
  (:goal (and
    (planned_stay paris day1 day4)
    (planned_stay nice day5 day9)
    (planned_stay mykonos day10 day11)
    (visited nice)
    (visited mykonos)
    (meet_friends day1)
  ))
)