(define (problem travel-days-8-instance)
  (:domain travel-days)
  ; Cities and days
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    berlin munich dubrovnik - city
  )
  (:init
    ; Day ordering (contiguous 8-day horizon)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    ; Direct-flight adjacency (daily service assumed; no Berlin<->Dubrovnik legs)
    (connected berlin munich)
    (connected munich berlin)
    (connected munich dubrovnik)
    (connected dubrovnik munich)

    ; Start in Berlin on day 1
    (at d1 berlin)
    (decided d1)
    (frontier d1)

    ; Notes (comments only):
    ; - Hard constraints: Day 1 in Berlin; Day 4 in Berlin; direct flights only.
    ; - Max one flight per day: enforced by frontier sequencing and single assignment per day.
    ; - Any Berlin–Dubrovnik travel must connect via Munich (captured by adjacency).
    ; - Applied relaxed desired stays (total 8): Berlin 4, Munich 3, Dubrovnik 1.
    ; - Recommended exact itinerary below is enforced as strict goal facts.
  )
  (:goal (and
    ; Exact 8-day itinerary (strict):
    (at d1 berlin)      ; mandated: start day 1 in Berlin
    (at d2 berlin)
    (at d3 berlin)
    (at d4 berlin)      ; mandated: day 4 in Berlin
    (at d5 munich)
    (at d6 munich)
    (at d7 munich)
    (at d8 dubrovnik)

    ; Ensure the sequence has been constructed through the last day
    (frontier d8)
  ))
)