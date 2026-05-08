(define (problem travel_plan_problem)
  (:domain travel_plan)
  
  (:objects
    frankfurt florence valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )
  
  (:init
    (at frankfurt day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (has_flight frankfurt florence)
    (has_flight florence frankfurt)
    (has_flight valencia frankfurt)
    (has_flight frankfurt valencia)
  )
  
  (:goal (and
    (at frankfurt day5)
    (at frankfurt day6)
    (at frankfurt day7)
    (at frankfurt day8)
    (at frankfurt day9)
    (at florence day3)
    (at florence day4)
    (at valencia day1)
    (at valencia day2)
    (or (visited_relatives day1) (visited_relatives day2))
  ))
)