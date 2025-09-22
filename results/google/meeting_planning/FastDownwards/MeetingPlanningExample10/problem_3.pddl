(define (problem meet-james-combined-problem-fd)
  (:domain meet-james-combined-fd)

  (:objects
    visitor james - person
    golden_gate_park marina_district - location
    t540 t599 t615 t630 t633 - timepoint
  )

  (:init
    ; travel availability encoded as symbolic mappings between timepoints
    (travel16 t599 t615)
    (travel18 t615 t633)

    ; ordering of symbolic timepoints
    (later t540 t599)
    (later t599 t615)

    ; a 15-minute meeting can occur from t615 to t630
    (meeting15 t615 t630)

    ; James is available at Marina District from t615 to t630
    (avail-interval james marina_district t615 t630)

    ; initial locations at symbolic timepoints
    (at visitor golden_gate_park t540)
    (at james marina_district t615)

    ; initialize total cost
    (= (total-cost) 0)
  )

  (:goal (met visitor james))

  (:metric minimize (total-cost))
)