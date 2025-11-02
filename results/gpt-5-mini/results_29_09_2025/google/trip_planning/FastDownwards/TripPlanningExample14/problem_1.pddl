(define (problem TripPlanningExample14-prob)
  (:domain trip_planning_domain_14)
  (:objects
    lyon frankfurt krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (direct lyon frankfurt)
    (direct frankfurt lyon)
    (direct frankfurt krakow)
    (direct krakow frankfurt)

    (in lyon day1)
  )
  (:goal (and
    (in lyon day1)
    (in lyon day2)
    (in lyon day3)
    (in lyon day4)
    (in lyon day5)
    (in lyon day6)
    (in frankfurt day7)
    (in krakow day8)
    (in krakow day9)
    (in krakow day10)
  ))
)