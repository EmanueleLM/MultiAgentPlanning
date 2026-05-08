(define (problem tripplanningexample10_problem)
  (:domain tripplanningexample10)

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (at oslo)
    (current_day day1)
    (occupied oslo day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (direct oslo dublin)
    (direct dublin oslo)
    (direct dublin valencia)
    (direct valencia dublin)
  )

  (:goal
    (and
      (current_day day9)
      (at valencia)
      (flight_done)

      (occupied oslo day1)
      (occupied oslo day2)
      (occupied oslo day3)

      (occupied dublin day4)

      (occupied valencia day5)
      (occupied valencia day6)
      (occupied valencia day7)
      (occupied valencia day8)
      (occupied valencia day9)
    )
  )
)