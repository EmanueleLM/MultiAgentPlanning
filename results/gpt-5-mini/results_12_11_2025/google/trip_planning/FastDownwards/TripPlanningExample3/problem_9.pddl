(define (problem trip-berlin-warsaw-bucharest)
  (:domain trip-domain)
  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )
  (:init
    ;; initial day and location
    (cur d1)
    (at berlin)

    ;; explicit day ordering (discrete time progression)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (last-day d6)

    ;; direct flights (undirected)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ;; Allowed city occupancy per day (enforces contiguous Bucharest occupancy on d5-d6).
    (allowed d1 berlin)
    (allowed d1 warsaw)
    (allowed d2 berlin)
    (allowed d2 warsaw)
    (allowed d3 berlin)
    (allowed d3 warsaw)
    (allowed d4 berlin)
    (allowed d4 warsaw)
    (allowed d5 bucharest)
    (allowed d6 bucharest)
  )

  (:goal (and
    ;; Every day must be booked exactly once (enforced by single booking via day-booked).
    (day-booked d1)
    (day-booked d2)
    (day-booked d3)
    (day-booked d4)
    (day-booked d5)
    (day-booked d6)
    ;; Hard constraint: be in Bucharest on d5 and d6.
    (booked d5 bucharest)
    (booked d6 bucharest)
  ))
)