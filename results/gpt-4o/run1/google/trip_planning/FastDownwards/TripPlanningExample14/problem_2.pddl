(define (problem travel_plan_instance)
  (:domain travel_plan)
  
  (:objects 
    lyon frankfurt krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  
  (:init 
    (at lyon day1)
    (connected lyon frankfurt)
    (connected frankfurt krakow)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (current_day day1)
  )
  
  (:goal 
    (and
      (at lyon day7)
      (at krakow day10)
      (at frankfurt day5)
    )
  )
)