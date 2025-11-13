(define (problem TripProblem)
  (:domain TripDomain)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    brussels valencia nice - city
  )

  (:init
    ;; contiguous day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; first day marker
    (first d1)

    ;; direct flight graph: undirected edges encoded as both directions
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    ;; self edges to allow staying in the same city via direct edges if needed
    (direct brussels brussels)
    (direct valencia valencia)
    (direct nice nice)

    ;; meeting window explicit marking for days allowed for meeting in Nice (day 1..day 6)
    (meeting_allowed d1) (meeting_allowed d2) (meeting_allowed d3)
    (meeting_allowed d4) (meeting_allowed d5) (meeting_allowed d6)
  )

  ;; The goal encodes the exact audited per-day itinerary (must be achieved exactly).
  (:goal (and
    ;; Valencia 3 days (d1..d3)
    (at d1 valencia)
    (at d2 valencia)
    (at d3 valencia)

    ;; Brussels 2 days (d4..d5)
    (at d4 brussels)
    (at d5 brussels)

    ;; Nice 4 days (d6..d9)
    (at d6 nice)
    (at d7 nice)
    (at d8 nice)
    (at d9 nice)
  )))