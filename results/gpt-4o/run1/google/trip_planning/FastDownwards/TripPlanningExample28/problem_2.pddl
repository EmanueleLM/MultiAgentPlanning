(define (problem travel_plan_instance)
  (:domain travel_plan)
  (:objects
    venice florence zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    (at venice day1)
    (connected venice zurich)
    (connected zurich florence)
    (connected zurich venice)
    
    (next day1 day2) (next day2 day3)
    (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7)
    (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)
    (next day11 day12)
  )

  (:goal
    (and
      (visited venice day6)
      (visited florence day12)
      (visited zurich day8)
    )
  )
)