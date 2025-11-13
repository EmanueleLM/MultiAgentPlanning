(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    venice zurich florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 dend - day
  )

  (:init
    ;; Start state: first city and day
    (current-city venice)
    (current-day d1)

    ;; Direct flight connectivity (direct-only policy)
    ;; Venice <-> Zurich is bidirectional
    (direct venice zurich)
    (direct zurich venice)
    ;; Zurich -> Florence is one-way
    (direct zurich florence)

    ;; Successor (day) relation: 12 discrete days, then terminal day
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
    (next d11 d12)
    (next d12 dend)

    ;; All twelve days are initially unscheduled
    (unscheduled d1)
    (unscheduled d2)
    (unscheduled d3)
    (unscheduled d4)
    (unscheduled d5)
    (unscheduled d6)
    (unscheduled d7)
    (unscheduled d8)
    (unscheduled d9)
    (unscheduled d10)
    (unscheduled d11)
    (unscheduled d12)
  )

  ;; Goals enforce the audited itinerary exactly:
  ;; - Days 1-5: Venice (5 days)
  ;; - Days 6-7: Zurich (2 days)
  ;; - Days 8-12: Florence (5 days)
  ;; - Final day cursor reaches terminal day and final location is Florence.
  (:goal (and
    (day-scheduled d1 venice)
    (day-scheduled d2 venice)
    (day-scheduled d3 venice)
    (day-scheduled d4 venice)
    (day-scheduled d5 venice)

    (day-scheduled d6 zurich)
    (day-scheduled d7 zurich)

    (day-scheduled d8 florence)
    (day-scheduled d9 florence)
    (day-scheduled d10 florence)
    (day-scheduled d11 florence)
    (day-scheduled d12 florence)

    (current-day dend)
    (current-city florence)
  ))
)