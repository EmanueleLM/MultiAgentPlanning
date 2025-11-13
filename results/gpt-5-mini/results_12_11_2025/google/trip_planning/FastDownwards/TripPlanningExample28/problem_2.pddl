(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    venice zurich florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 dend - day
  )

  (:init
    (current-city venice)
    (current-day d1)

    ;; Direct flight connectivity (direct-only policy)
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    ;; Allowed flight transitions on specific days to enforce the audited route order and contiguous stays
    ;; Flight from Venice to Zurich on day d6 (schedules d6 as Zurich and advances to d7)
    (allowed-flight d6 venice zurich)
    ;; Flight from Zurich to Florence on day d8 (schedules d8 as Florence and advances to d9)
    (allowed-flight d8 zurich florence)

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

  (:goal (and
    ;; Enforce exact contiguous allocation matching the audited itinerary:
    ;; Venice: days d1-d5 (5 days)
    (day-scheduled d1 venice)
    (day-scheduled d2 venice)
    (day-scheduled d3 venice)
    (day-scheduled d4 venice)
    (day-scheduled d5 venice)

    ;; Zurich: days d6-d7 (2 days)
    (day-scheduled d6 zurich)
    (day-scheduled d7 zurich)

    ;; Florence: days d8-d12 (5 days)
    (day-scheduled d8 florence)
    (day-scheduled d9 florence)
    (day-scheduled d10 florence)
    (day-scheduled d11 florence)
    (day-scheduled d12 florence)

    ;; Final day cursor reaches terminal day and final location is Florence
    (current-day dend)
    (current-city florence)
  ))
)