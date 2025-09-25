(define (problem trip-multiagent-problem)
  (:domain trip-multiagent)

  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (workshop-window day5)
    (workshop-window day6)
    (workshop-window day7)
    (workshop-window day8)

    (workshop-city riga)

    (at london day1)
    (visited london)
    (assigned day1)
    (available day2)
    (available day3)
    (available day4)
    (available day5)
    (available day6)
    (available day7)
    (available day8)
  )

  (:goal (and
           (at london day1)
           (at london day2)
           (at london day3)
           (at bucharest day4)
           (at bucharest day5)
           (at bucharest day6)
           (at riga day7)
           (at riga day8)
           (attended)
         )
  )
)