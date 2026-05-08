(define (problem meet_james_specific_instance)
  (:domain meet_james_san_francisco_day)

  (:objects
    golden_gate_park marina_district - location
    james - person
    t0900 t0916 t1015 t1030 t1330 - timepoint
  )

  (:init
    (at golden_gate_park)
    (current_time t0900)
    (person_at james marina_district)
    (available_start james t1015)
    (available_end james t1330)
  )

  (:goal
    (and
      (met james)
    )
  )
)