(define (problem TripProblem)
  (:domain TripDomain)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    Brussels Valencia Nice - city
  )

  (:init
    ;; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; first day
    (first d1)

    ;; direct flight graph (bidirectional) and self-edges to allow staying
    (direct Brussels Valencia) (direct Valencia Brussels)
    (direct Brussels Nice)    (direct Nice Brussels)

    (direct Brussels Brussels) (direct Valencia Valencia) (direct Nice Nice)
  )

  (:goal (and
    (at d1 Valencia)
    (at d2 Valencia)
    (at d3 Valencia)
    (at d4 Brussels)
    (at d5 Brussels)
    (at d6 Nice)
    (at d7 Nice)
    (at d8 Nice)
    (at d9 Nice)
  ))
)