(define (problem trip_to_europe)
  (:domain travel_planner)
  
  (:objects 
    porto barcelona florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )
  
  (:init
    (at porto day1)

    (flight_available porto barcelona)
    (flight_available barcelona florence)

    (next_day day1 day2) 
    (next_day day2 day3) 
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)
    (next_day day11 day12)
    
    (relative_visit porto day1)
    (relative_visit porto day2)
    (relative_visit porto day3)
  )
  
  (:goal
    (and
      (at florence day9) 
      (at florence day10)
      (at florence day11)
      (at florence day12)

      (at barcelona day4)
      (at barcelona day5)
      (at barcelona day6)
      (at barcelona day7)
      (at barcelona day8)

      (exist (?d - day) (and (relative_visit porto ?d) (at porto ?d)))
    )
  )
)