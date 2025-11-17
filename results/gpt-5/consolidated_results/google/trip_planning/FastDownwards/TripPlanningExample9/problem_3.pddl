(define (problem tripplanningexample9-problem)
  (:domain tripplanningexample9)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
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

    (in-window day5)
    (in-window day6)
    (in-window day7)
    (in-window day8)
    (in-window day9)
    (in-window day10)

    (edge bucharest frankfurt)
    (edge frankfurt bucharest)
    (edge frankfurt stuttgart)
    (edge stuttgart frankfurt)

    (rem-b-3)
    (rem-f-3)
    (rem-s-4)
  )

  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)
      (assigned day9)
      (assigned day10)
      (rem-b-0)
      (rem-f-0)
      (rem-s-0)
      (workshop-done)
    )
  )
)