(define (problem trip-11-days)
  (:domain multiagent-trip)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    berlin porto krakow - city
  )
  (:init
    ;; flights (only direct flights allowed)
    (flight berlin porto)
    (flight porto berlin)
    (flight berlin krakow)
    (flight krakow berlin)

    ;; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)

    ;; start location (day 1)
    (at berlin d1)
    (assigned d1)

    ;; wedding constraint (must be in Porto at day 10)
    (wedding porto d10)
  )
  (:goal (and
    ;; required stays per human specification (private desires are treated as hard constraints)
    ;; Berlin: 6 distinct days
    (at berlin d1) (at berlin d2) (at berlin d3) (at berlin d4) (at berlin d5) (at berlin d6)
    ;; Krakow: 5 distinct days
    (at krakow d7) (at krakow d8) (at krakow d9) (at krakow d10) (at krakow d11)
    ;; Porto: 2 distinct days, including attendance at wedding (day 10)
    (at porto d10) (at porto d11)
    ;; ensure wedding attendance day explicitly (also implied by at porto d10)
    (wedding porto d10)
  ))
)