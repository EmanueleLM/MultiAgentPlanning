(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    reykjavik riga paris - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
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

    (direct paris reykjavik)
    (direct reykjavik paris)
    (direct riga paris)
    (direct paris riga)

    (required reykjavik day6)
    (required reykjavik day7)
    (required reykjavik day8)
    (required reykjavik day9)
    (required reykjavik day10)
  )

  (:goal
    (and
      (current_day day10)

      (visited reykjavik day1)
      (visited reykjavik day2)
      (visited reykjavik day3)
      (visited reykjavik day4)
      (visited reykjavik day5)

      (visited riga day1)
      (visited riga day2)
      (visited riga day3)

      (visited paris day1)
      (visited paris day2)
      (visited paris day3)
      (visited paris day4)

      (visited reykjavik day6)
      (visited reykjavik day7)
      (visited reykjavik day8)
      (visited reykjavik day9)
      (visited reykjavik day10)
    )
  )
)