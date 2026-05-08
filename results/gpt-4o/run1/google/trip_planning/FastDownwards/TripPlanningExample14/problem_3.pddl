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
      ; Ensure presence for 7 days in Lyon
      (at lyon day7)
      ; Travel from Lyon to Krakow via Frankfurt, spend 3 days in Krakow including day 10, attend show
      (at krakow day10)
      ; Ensure presence in Frankfurt for set times
      (at frankfurt day5)
    )
  )
)