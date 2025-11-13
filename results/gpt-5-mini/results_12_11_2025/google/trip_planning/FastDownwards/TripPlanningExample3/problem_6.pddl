(define (problem trip-berlin-warsaw-bucharest)
  (:domain trip-domain)
  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )
  (:init
    (cur d1)
    (at berlin)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)

    (last-day d6)

    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)
  )

  (:goal (and
    (day-booked d1)
    (day-booked d2)
    (day-booked d3)
    (day-booked d4)
    (day-booked d5)
    (day-booked d6)
    (booked d5 bucharest)
    (booked d6 bucharest)
  ))
)