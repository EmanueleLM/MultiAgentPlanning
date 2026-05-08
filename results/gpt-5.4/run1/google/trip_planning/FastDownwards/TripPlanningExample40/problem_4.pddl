(define (problem tripplanningexample40)
  (:domain tripplanningexample40_trip)

  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (direct oslo reykjavik)
    (direct reykjavik oslo)
    (direct oslo manchester)
    (direct manchester oslo)

    (current_day day1)
    (at manchester)
    (visited manchester day1)
  )

  (:goal
    (and
      (current_day day8)

      (visited manchester day1)
      (visited manchester day2)

      (visited reykjavik day3)
      (visited reykjavik day4)

      (visited oslo day5)
      (visited oslo day6)
      (visited oslo day7)
      (visited oslo day8)
    )
  )
)