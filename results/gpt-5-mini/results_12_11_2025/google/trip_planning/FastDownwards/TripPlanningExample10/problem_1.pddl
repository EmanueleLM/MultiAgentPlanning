(define (problem trip9)
  (:domain itinerary)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    oslo dublin valencia - city
  )
  (:init
    ;; day ordering (linear chain)
    (first d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ;; Connectivity: self-stays allowed and only the listed direct flights
    (connected oslo oslo)
    (connected dublin dublin)
    (connected valencia valencia)

    (connected oslo dublin)
    (connected dublin oslo)

    (connected dublin valencia)
    (connected valencia dublin)
  )

  ;; Goal fixes the reconciled itinerary (auditor's minimal-relaxation choice):
  ;; Days 1-3 Oslo, Day 4 Dublin, Days 5-9 Valencia.
  (:goal (and
    (at d1 oslo)
    (at d2 oslo)
    (at d3 oslo)
    (at d4 dublin)
    (at d5 valencia)
    (at d6 valencia)
    (at d7 valencia)
    (at d8 valencia)
    (at d9 valencia)
  ))
)