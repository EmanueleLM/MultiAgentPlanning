(define (problem tripplanningexample9)
  (:domain european_trip_10_days)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at bucharest)

    (direct bucharest frankfurt)
    (direct frankfurt bucharest)
    (direct frankfurt stuttgart)
    (direct stuttgart frankfurt)

    (current_day day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    (need_bucharest_3)
    (need_frankfurt_3)
    (need_stuttgart_6)
  )

  (:goal
    (and
      (current_day day11)
      (need_bucharest_0)
      (need_frankfurt_0)
      (need_stuttgart_0)
      (workshop_attended)
    )
  )
)