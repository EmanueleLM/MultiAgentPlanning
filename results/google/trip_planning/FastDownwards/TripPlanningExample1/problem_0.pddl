; Problem: 15-day itinerary visiting Split, Manchester, and Riga using only direct flights.
; Assumptions reiterated here (encoded as facts):
; - Start at Split.
; - Direct flights are present (bidirectional) between the three named cities so that a plan is feasible
;   using only direct flights.
(define (problem itinerary-15days)
  (:domain itinerary)

  (:objects
    split manchester riga - city
  )

  (:init
    ; Starting location and visited status for the starting city.
    (at split)
    (visited split)

    ; Flight network (assumed bidirectional direct flights between the three cities).
    (direct split manchester)
    (direct manchester split)
    (direct split riga)
    (direct riga split)
    (direct manchester riga)
    (direct riga manchester)

    ; Day counter starts at day 1.
    (= (current-day) 1)
  )

  ; Goal: after scheduling actions so that the day counter reaches exactly 15,
  ; the traveler must have visited all three required cities.
  (:goal (and
    (visited split)
    (visited manchester)
    (visited riga)
    (= (current-day) 15)
  ))
)