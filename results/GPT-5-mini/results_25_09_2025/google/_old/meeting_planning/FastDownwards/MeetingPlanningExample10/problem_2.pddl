(define (problem meet-james-combined-problem-symbolic)
  (:domain meet-james-combined-symbolic)

  (:objects
    visitor james - person
    golden_gate_park marina_district - location
    t540 t599 t615 t630 t633 - timepoint
  )

  (:init
    (travel16 t599 t615)
    (travel18 t615 t633)

    (later t540 t599)
    (later t599 t615)

    (meeting15 t615 t630)

    (avail-interval james marina_district t615 t630)

    (at visitor golden_gate_park t540)
    (at james marina_district t615)
  )

  (:goal (met visitor james))

  (:metric minimize (total-cost))
)