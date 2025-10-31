(define (problem trip-10days)
  (:domain trip-planning)
  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)
    (current d1)
    (at frankfurt d1)
    (visited frankfurt d1)
    (flight frankfurt reykjavik) (flight reykjavik frankfurt)
    (flight frankfurt split) (flight split frankfurt)
  )
  (:goal
    (and
      (visited frankfurt d1) (visited frankfurt d7)
      (visited split d2) (visited split d3) (visited split d4) (visited split d5) (visited split d6)
      (visited reykjavik d8) (visited reykjavik d9) (visited reykjavik d10)
      (current d10)
    )
  )
)