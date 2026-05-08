(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    golden_gate_park marina_district - location
    james - person
    t0900 t0959 t1015 t1030 t1330 - time
  )

  (:init
    (at golden_gate_park)
    (current_time t0900)

    (next_time t0900 t0959)
    (next_time t0959 t1015)
    (next_time t1015 t1030)
    (next_time t1030 t1330)

    (travel_edge golden_gate_park marina_district t0959 t1015)

    (meeting_slot james marina_district t1015 t1030)
  )

  (:goal
    (and
      (met james)
    )
  )
)