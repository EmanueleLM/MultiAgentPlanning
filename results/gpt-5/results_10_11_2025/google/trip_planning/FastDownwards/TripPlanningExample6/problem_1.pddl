(define (problem trip-8-instance)
  (:domain trip-days)
  ; Soft preferences (comments):
  ; - Desired stays sum to 10 > 8. Applied relaxation per policy: Berlin=4 (keep), Dubrovnik=3 (keep), Munich=1.
  ; - Objective: minimize flights (city switches).
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    berlin munich dubrovnik - city
  )
  (:init
    ; Day ordering across the 8-day horizon
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    ; Direct-flight adjacency (only these legs are allowed)
    (connected berlin munich)
    (connected munich berlin)
    (connected munich dubrovnik)
    (connected dubrovnik munich)

    ; Start in Berlin on day 1
    (at d1 berlin)
    (decided d1)
    (frontier d1)
    (visited berlin)

    ; Mandatory obligation: day 4 must be in Berlin
    (hasreq d4)
    (req d4 berlin)
  )
  (:goal (and
    ; Complete the 8-day sequence
    (frontier d8)

    ; Visit all three cities at least once during the trip
    (visited berlin)
    (visited munich)
    (visited dubrovnik)
  ))
  (:metric minimize (total-cost))
)