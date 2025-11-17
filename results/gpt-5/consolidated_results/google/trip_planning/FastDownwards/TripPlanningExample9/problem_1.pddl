(define (problem tripplanningexample9-problem)
  (:domain tripplanningexample9)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    frankfurt bucharest stuttgart - city
  )

  (:init
    ; sequencing over 10 days
    (current day1)
    (first day1)
    (last day10)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ; workshop window: days 5..10 inclusive
    (in-window day5)
    (in-window day6)
    (in-window day7)
    (in-window day8)
    (in-window day9)
    (in-window day10)

    ; direct flight adjacency (bidirectional where available)
    (edge bucharest frankfurt)
    (edge frankfurt bucharest)
    (edge frankfurt stuttgart)
    (edge stuttgart frankfurt)

    ; counters start at 0
    (= (count-bucharest) 0)
    (= (count-frankfurt) 0)
    (= (count-stuttgart) 0)
  )

  (:goal
    (and
      (= (count-bucharest) 3)
      (= (count-frankfurt) 3)
      (= (count-stuttgart) 4)
      (workshop-done)
    )
  )
)