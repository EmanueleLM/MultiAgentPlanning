(define (problem trip_problem)
  (:domain trip_planning)

  (:objects
    oslo dublin valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ;; Day sequence for a 9-day trip.
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ;; Direct flight routes.
    (conn oslo dublin)
    (conn dublin oslo)
    (conn dublin valencia)
    (conn valencia dublin)

    ;; Initial starting point: Oslo on Day 1.
    (at oslo d1)
    (spent oslo d1)
  )

  (:goal
    (and
      ;; Spent 3 days in Oslo.
      ;; The overlap interpretation allows 11 city-days to fit into 9 calendar-days.
      (spent oslo d1)
      (spent oslo d2)
      (spent oslo d3)

      ;; Spent 3 days in Dublin.
      (spent dublin d3)
      (spent dublin d4)
      (spent dublin d5)

      ;; Spent 5 days in Valencia, including relatives visit between day 5 and 9.
      (spent valencia d5)
      (spent valencia d6)
      (spent valencia d7)
      (spent valencia d8)
      (spent valencia d9)
    )
  )
)