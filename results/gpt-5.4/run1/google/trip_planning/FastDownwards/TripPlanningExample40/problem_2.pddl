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

    (final_day day8)

    (direct oslo reykjavik)
    (direct reykjavik oslo)
    (direct oslo manchester)
    (direct manchester oslo)

    (current_day day1)
    (at manchester)
    (occupied manchester day1)
  )

  (:goal
    (and
      (current_day day8)

      (occupied manchester day1)
      (occupied manchester day2)

      (occupied reykjavik day7)
      (occupied reykjavik day8)

      (occupied oslo day2)
      (occupied oslo day3)
      (occupied oslo day4)
      (occupied oslo day5)
      (occupied oslo day6)
      (occupied oslo day7)
    )
  )
)