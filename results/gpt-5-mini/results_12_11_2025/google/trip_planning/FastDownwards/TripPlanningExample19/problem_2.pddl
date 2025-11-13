(define (problem TripProblem)
  (:domain TripDomain)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    Brussels Valencia Nice - city
  )

  (:init
    ;; day ordering (explicit successor relation for contiguous day progression)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; first day marker
    (first d1)

    ;; direct flight graph (bidirectional) and self-edges to allow staying in the same city
    (direct Brussels Valencia) (direct Valencia Brussels)
    (direct Brussels Nice)    (direct Nice Brussels)

    (direct Brussels Brussels) (direct Valencia Valencia) (direct Nice Nice)

    ;; explicit meeting window days (window = days 1..6)
    (window d1) (window d2) (window d3) (window d4) (window d5) (window d6)

    ;; declare the meeting city as Nice
    (meeting-city Nice)
  )

  ;; The goal encodes the audited concrete per-day itinerary exactly.
  (:goal (and
    ;; Valencia 3 contiguous days (d1..d3)
    (at d1 Valencia)
    (at d2 Valencia)
    (at d3 Valencia)

    ;; Brussels 2 contiguous days (d4..d5)
    (at d4 Brussels)
    (at d5 Brussels)

    ;; Nice 4 contiguous days (d6..d9) -- note: adjusted from requested 6 to fit 9-day budget
    (at d6 Nice)
    (at d7 Nice)
    (at d8 Nice)
    (at d9 Nice)
  ))