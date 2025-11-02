(define (problem TripPlanningExample28-prob)
  (:domain TripPlanningExample28)

  (:objects
    vce zrh flr - city
  )

  (:init
    (at vce)

    ; Directed direct flights (static connectivity)
    (direct vce zrh)
    (direct zrh vce)
    (direct zrh flr)

    ; Initial visitation and counters
    (visited vce)
    (= (days-total) 0)
    (= (days-in vce) 0)
    (= (days-in zrh) 0)
    (= (days-in flr) 0)
  )

  (:goal (and
    ; Visit all three cities
    (visited vce)
    (visited zrh)
    (visited flr)

    ; Exact day counts
    (= (days-total) 12)
    (= (days-in zrh) 2)
    (= (days-in vce) 6)
    (= (days-in flr) 4)
  ))
)