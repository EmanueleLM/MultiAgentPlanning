(define (problem trip-prague-vienna-porto)
  (:domain city-trip)
  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (at prague day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (connected prague vienna)
    (connected vienna prague)
    (connected vienna porto)
    (connected porto vienna)
    (is-prague prague)
    (workshop-window day1)
    (workshop-window day2)
    (workshop-window day3)
  )

  (:goal
    (and
      (attended-workshop)
      (at prague day1)
      (at prague day2)
      (at prague day3)
      (at vienna day4)
      (at vienna day5)
      (at vienna day6)
      (at porto day7)
      (at porto day8)
      (at porto day9)
    )
  )
)