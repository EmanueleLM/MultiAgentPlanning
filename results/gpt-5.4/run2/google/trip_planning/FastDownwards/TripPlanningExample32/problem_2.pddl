(define (problem tripplanningexample32_problem)
  (:domain tripplanningexample32)

  (:objects
    riga paris reykjavik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (current day1)

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
  )

  (:goal
    (and
      (current day10)

      (at reykjavik day6)
      (at reykjavik day7)
      (at reykjavik day8)
      (at reykjavik day9)
      (at reykjavik day10)

      (at riga day1)
      (at riga day2)
      (at riga day3)

      (at paris day4)
      (at paris day5)
      (at paris day6)
      (at paris day7)

      (visited riga)
      (visited paris)
      (visited reykjavik)
    )
  )
)