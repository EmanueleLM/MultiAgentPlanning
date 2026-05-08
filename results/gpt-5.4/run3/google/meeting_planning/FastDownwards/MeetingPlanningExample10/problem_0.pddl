(define (problem san_francisco_meet_james_instance)
  (:domain san_francisco_meet_james)

  (:objects
    golden_gate_park marina_district - location
    traveler james - person
    t0900 t0916 t1015 t1315 t1330 t1333 - time
  )

  (:init
    (at traveler golden_gate_park)
    (at james marina_district)
    (current_time t0900)

    (connected golden_gate_park marina_district)
    (connected marina_district golden_gate_park)

    (travel_16 golden_gate_park marina_district)
    (travel_18 marina_district golden_gate_park)

    (next t0900 t0916)
    (next t0916 t1015)
    (next t1015 t1315)
    (next t1315 t1330)
    (next t1330 t1333)

    (advance_16 t0900 t0916)
    (advance_18 t1315 t1333)

    (available_to_meet james t1015)
    (available_to_meet james t1315)
  )

  (:goal
    (and
      (met james)
    )
  )
)