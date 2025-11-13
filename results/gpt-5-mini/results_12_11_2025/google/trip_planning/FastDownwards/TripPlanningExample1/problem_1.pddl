(define (problem trip1)
  (:domain trip-planning)
  (:objects riga manchester split - city)

  (:init
    ;; start location (first city in route_order)
    (at riga)

    ;; directed flight graph (only these direct flights exist)
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)

    ;; numeric fluents: total days and per-city needs (from auditor final allocation)
    (= (days-remaining) 15)
    (= (need-riga) 5)
    (= (need-manchester) 4)
    (= (need-split) 6)
  )

  ;; Goal: all days used and all per-city needs satisfied
  (:goal
    (and
      (= (days-remaining) 0)
      (= (need-riga) 0)
      (= (need-manchester) 0)
      (= (need-split) 0)
    )
  )
)