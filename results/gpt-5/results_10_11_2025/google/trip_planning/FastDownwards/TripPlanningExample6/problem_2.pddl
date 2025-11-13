(define (problem trip-8-instance)
  (:domain trip-days)
  ; Soft preferences (comments):
  ; - Requested days sum to 10 > 8. Applied relaxation: Berlin=4 (kept), Dubrovnik=3 (kept), Munich=1.
  ; - Objective (informal): minimize flights and switches. Final itinerary uses 2 flights.

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    berlin munich dubrovnik - city
  )
  (:init
    ; Day ordering
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    ; Direct-flight adjacency (undirected)
    (connected berlin munich)
    (connected munich berlin)
    (connected munich dubrovnik)
    (connected dubrovnik munich)

    ; Start on day 1 in Berlin
    (at d1 berlin)
    (assigned d1)
    (frontier d1)
  )
  (:goal (and
    ; Enforce the exact 8-day itinerary
    (at d1 berlin)
    (at d2 berlin)
    (at d3 berlin)
    (at d4 berlin)
    (at d5 munich)
    (at d6 dubrovnik)
    (at d7 dubrovnik)
    (at d8 dubrovnik)

    ; Ensure sequential assignment reached the final day
    (frontier d8)
  ))
)