(define (problem tripplanningexample9_problem)
  (:domain tripplanningexample9)

  (:objects
    bucharest frankfurt stuttgart - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (direct bucharest frankfurt)
    (direct frankfurt bucharest)
    (direct frankfurt stuttgart)
    (direct stuttgart frankfurt)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (current day1)
    (final_day day10)

    (workshop_window day5)
    (workshop_window day6)
    (workshop_window day7)
    (workshop_window day8)
    (workshop_window day9)
    (workshop_window day10)
  )

  (:goal
    (and
      (current day10)

      (visited_bucharest)
      (visited_frankfurt)
      (visited_stuttgart)

      (in bucharest day1)
      (in bucharest day2)
      (in bucharest day3)

      (in frankfurt day4)
      (in frankfurt day5)
      (in frankfurt day6)

      (in stuttgart day5)
      (in stuttgart day6)
      (in stuttgart day7)
      (in stuttgart day8)
      (in stuttgart day9)
      (in stuttgart day10)

      (workshop_attended)
    )
  )
)