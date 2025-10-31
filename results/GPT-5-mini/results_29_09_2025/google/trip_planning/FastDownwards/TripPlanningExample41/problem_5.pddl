(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    stockholm athens mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    (direct athens mykonos)
    (direct mykonos athens)
    (direct stockholm athens)
    (direct athens stockholm)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (at stockholm d1)
  )
  (:goal (and
    (at stockholm d1) (at stockholm d2) (at stockholm d3) (at stockholm d4) (at stockholm d5) (at stockholm d6)
    (at athens d7) (at athens d8) (at athens d9) (at athens d10) (at athens d11)
    (at mykonos d12) (at mykonos d13)
  ))
)