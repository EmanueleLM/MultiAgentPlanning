(define (problem tripplanningexample9)
  (:domain european_trip_10_days)

  (:objects
    bucharest frankfurt stuttgart - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at bucharest)

    (direct bucharest frankfurt)
    (direct frankfurt bucharest)
    (direct frankfurt stuttgart)
    (direct stuttgart frankfurt)

    (current_day day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)

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