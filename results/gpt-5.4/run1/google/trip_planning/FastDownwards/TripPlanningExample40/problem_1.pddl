(define (problem tripplanningexample40)
  (:domain european_trip_8_days)

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
    (visited_on manchester day1)
  )

  (:goal
    (and
      (current_day day8)

      (visited_on manchester day1)
      (visited_on manchester day2)

      (visited_on reykjavik day7)
      (visited_on reykjavik day8)

      (visited_on oslo day2)
      (visited_on oslo day3)
      (visited_on oslo day4)
      (visited_on oslo day5)
      (visited_on oslo day6)
      (visited_on oslo day7)
    )
  )
)