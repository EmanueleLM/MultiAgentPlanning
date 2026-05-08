(define (problem travel_plan_problem)
  (:domain travel_plan)
  
  (:objects
    frankfurt florence valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    frankfurt_florence florence_frankfurt 
    valencia_frankfurt frankfurt_valencia - flight
  )
  
  (:init
    (at frankfurt day1)
    (sequence_valid day1 day2)
    (sequence_valid day2 day3)
    (sequence_valid day3 day4)
    (sequence_valid day4 day5)
    (sequence_valid day5 day6)
    (sequence_valid day6 day7)
    (sequence_valid day7 day8)
    (sequence_valid day8 day9)
    (= (total-cost) 0)
  )
  
  (:goal (and
    (at valencia day1)
    (at valencia day2)
    (at florence day3)
    (at florence day4)
    (at frankfurt day6)
    (at frankfurt day7)
    (at frankfurt day8)
    (at frankfurt day9)
    (or (visited_relatives_valencia day1) (visited_relatives_valencia day2))
  ))

  (:metric minimize (total-cost))
)