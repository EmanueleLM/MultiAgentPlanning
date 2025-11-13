(define (problem TripProblem)
  (:domain TripDomain)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    Brussels Valencia Nice - city
  )

  (:init
    ;; contiguous day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; first day marker
    (first d1)

    ;; direct flight graph: undirected edges encoded as both directions
    (direct Brussels Valencia)
    (direct Valencia Brussels)
    (direct Brussels Nice)
    (direct Nice Brussels)

    ;; self edges to make direct predicate reflexive for completeness (staying handled by assign-next-stay)
    (direct Brussels Brussels)
    (direct Valencia Valencia)
    (direct Nice Nice)
  )

  ;; The goal encodes the exact audited per-day itinerary (must be achieved exactly).
  (:goal (and
    ;; Valencia 3 days (d1..d3)
    (at d1 Valencia)
    (at d2 Valencia)
    (at d3 Valencia)

    ;; Brussels 2 days (d4..d5)
    (at d4 Brussels)
    (at d5 Brussels)

    ;; Nice 4 days (d6..d9)
    (at d6 Nice)
    (at d7 Nice)
    (at d8 Nice)
    (at d9 Nice)
  )))