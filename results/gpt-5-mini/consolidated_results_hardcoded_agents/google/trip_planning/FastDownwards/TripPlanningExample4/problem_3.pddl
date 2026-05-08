(define (problem TripPlanningExample4-prob)
  (:domain trip-planning)
  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )
  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12)
    (first d1)
    (connected seville munich) (connected munich seville)
    (connected munich tallinn) (connected tallinn munich)
  )
  (:goal (and
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)
    (assigned d11) (assigned d12)
    (or (at tallinn d11) (at tallinn d12))
  ))
)