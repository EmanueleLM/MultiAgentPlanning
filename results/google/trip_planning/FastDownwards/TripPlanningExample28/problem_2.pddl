(define (problem TripPlanningExample28-prob)
  (:domain TripPlanningExample28)

  (:objects
    vce zrh flr - city
    vce-t1 vce-t2 vce-t3 vce-t4 vce-t5 vce-t6 - token
    zrh-t1 zrh-t2 - token
    flr-t1 flr-t2 flr-t3 flr-t4 - token
  )

  (:init
    (at vce)
    (direct vce zrh)
    (direct zrh vce)
    (direct zrh flr)

    (token-for vce-t1 vce)
    (token-for vce-t2 vce)
    (token-for vce-t3 vce)
    (token-for vce-t4 vce)
    (token-for vce-t5 vce)
    (token-for vce-t6 vce)

    (token-for zrh-t1 zrh)
    (token-for zrh-t2 zrh)

    (token-for flr-t1 flr)
    (token-for flr-t2 flr)
    (token-for flr-t3 flr)
    (token-for flr-t4 flr)
  )

  (:goal (and
    (visited vce)
    (visited zrh)
    (visited flr)

    (used vce-t1)
    (used vce-t2)
    (used vce-t3)
    (used vce-t4)
    (used vce-t5)
    (used vce-t6)

    (used zrh-t1)
    (used zrh-t2)

    (used flr-t1)
    (used flr-t2)
    (used flr-t3)
    (used flr-t4)
  ))
)