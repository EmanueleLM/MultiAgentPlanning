(define (problem trip-9days)
  (:domain trip-planning)

  (:objects
    oslo dublin valencia - city
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

    (flight_allowed oslo dublin)
    (flight_allowed dublin oslo)
    (flight_allowed dublin valencia)
    (flight_allowed valencia dublin)

    (present oslo day1)
  )

  (:goal (and
    (present oslo day1)
    (present oslo day2)
    (present oslo day3)
    (present dublin day4)
    (present valencia day5)
    (present valencia day6)
    (present valencia day7)
    (present valencia day8)
    (present dublin day9)
  ))
)