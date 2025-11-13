(define (problem trip-6day-direct-flights-prob)
  (:domain trip-6day-direct-flights)
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

    (= (total-cost) 0)
  )
  (:goal (and
    (booked d5 bucharest)
    (booked d6 bucharest)
  ))
  (:metric minimize (total-cost))
)