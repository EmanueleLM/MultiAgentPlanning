(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
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

    (direct frankfurt florence)
    (direct florence frankfurt)
    (direct frankfurt valencia)
    (direct valencia frankfurt)

    (current_day day1)
  )

  (:goal
    (and
      (at frankfurt day1)
      (at frankfurt day2)
      (at frankfurt day3)
      (at frankfurt day4)
      (at frankfurt day5)
      (at florence day6)
      (at florence day7)
      (at florence day8)
      (at florence day9)
      (visited_valencia_window)
      (current_day day9)
    )
  )
)