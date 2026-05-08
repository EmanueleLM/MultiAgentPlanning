(define (problem trip_planning_example_7)
  (:domain trip_planning)
  (:objects
    dubrovnik istanbul venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    ;; Starting position: the user begins at Dubrovnik.
    (at dubrovnik)
    (current_day d1)

    ;; Initialize all stay counters to zero.
    (stay_count dubrovnik c0)
    (stay_count istanbul c0)
    (stay_count venice c0)

    ;; Temporal succession for 11 days (from d1 to d12).
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)

    ;; Numeric succession for stay requirements (up to 6 days).
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)

    ;; Flight network based on specification:
    ;; From Dubrovnik to Istanbul; between Istanbul and Venice.
    (flight dubrovnik istanbul)
    (flight istanbul venice)
    (flight venice istanbul)
  )
  (:goal
    (and
      ;; Total trip duration of exactly 11 days.
      (current_day d12)
      
      ;; City-specific stay requirements.
      ;; The math (4+3+6=13) in 11 days requires 2 overlap (flight) days.
      (stay_count dubrovnik c4)
      (stay_count istanbul c3)
      (stay_count venice c6)
    )
  )
)