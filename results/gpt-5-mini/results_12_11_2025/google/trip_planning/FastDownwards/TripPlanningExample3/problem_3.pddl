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

    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    (unbooked d1)
    (unbooked d2)
    (unbooked d3)
    (unbooked d4)
    (unbooked d5)
    (unbooked d6)
  )

  (:goal (and
    (not (unbooked d1))
    (not (unbooked d2))
    (not (unbooked d3))
    (not (unbooked d4))
    (not (unbooked d5))
    (not (unbooked d6))
    (booked d5 bucharest)
    (booked d6 bucharest)
  ))
)