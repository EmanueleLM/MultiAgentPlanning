(define (problem trip11-a_preserve_Berlin_6)
  (:domain travel)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    Berlin Porto Krakow - city
  )

  (:init
    ;; Sequential day ordering (consecutive day links)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)

    ;; Flight adjacency (symmetric facts added explicitly)
    (adjacent Berlin Porto)
    (adjacent Porto Berlin)
    (adjacent Berlin Krakow)
    (adjacent Krakow Berlin)

    ;; Initial assignment: day 1 starts in Krakow (assigned)
    (at d1 Krakow)
    (assigned d1)
  )

  ;; Goal fixes the auditor-recommended itinerary (A_preserve_Berlin_6):
  ;; Days 1-3 Krakow, Days 4-9 Berlin, Days 10-11 Porto (wedding enforced)
  (:goal (and
    (at d1 Krakow)
    (at d2 Krakow)
    (at d3 Krakow)
    (at d4 Berlin)
    (at d5 Berlin)
    (at d6 Berlin)
    (at d7 Berlin)
    (at d8 Berlin)
    (at d9 Berlin)
    (at d10 Porto)
    (at d11 Porto)
  ))
)