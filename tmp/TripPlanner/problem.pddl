(define (problem plan-14-day-trip)
  (:domain travel-planner)
  (:objects
    traveler1 - traveler
    paris rome berlin - location
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    3 5 2 1 - number
  )

  (:init
    (at traveler1 paris day1)
    (has-direct-flight paris rome)
    (has-direct-flight rome berlin)
    (next-day day1 day2) (next-day day2 day3) (next-day day3 day4)
    (next-day day4 day5) (next-day day5 day6) (next-day day6 day7)
    (next-day day7 day8) (next-day day8 day9) (next-day day9 day10)
    (next-day day10 day11) (next-day day11 day12) (next-day day12 day13)
    (next-day day13 day14)
    (stay-duration paris 3)
    (stay-duration rome 5)
    (stay-duration berlin 2)
  )
  
  (:goal
    (and 
      (at traveler1 berlin day14)
    )
  )
)