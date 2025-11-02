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
    (flight frankfurt reykjavik) (flight reykjavik frankfurt)
    (flight frankfurt split) (flight split frankfurt)
    (= (days-in frankfurt) 1)
    (= (days-in reykjavik) 0)
    (= (days-in split) 0)
    (= (flight-count) 0)
  )
  (:goal
    (and
      (>= (days-in frankfurt) 1)
      (<= (days-in frankfurt) 2)
      (>= (days-in reykjavik) 1)
      (<= (days-in reykjavik) 3)
      (>= (days-in split) 1)
      (<= (days-in split) 7)
      (or (at reykjavik d8) (at reykjavik d9) (at reykjavik d10))
      (= (+ (days-in frankfurt) (days-in reykjavik) (days-in split)) 10)
      (<= (flight-count) 3)
      (current d10)
    )
  )
)