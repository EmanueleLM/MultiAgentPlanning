(define (problem meet_barbara_specific_instance)
  (:domain meet_barbara_day)

  (:objects
    bayview golden_gate_park - location
    barbara - friend
    t900 t930 t1000 t1030 t1100 t1130 - time
  )

  (:init
    (at bayview)
    (current_time t900)

    (connected bayview golden_gate_park)
    (connected golden_gate_park bayview)

    (next t900 t930)
    (next t930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)

    (friend_at barbara golden_gate_park)

    (barbara_available_interval_start t900)
    (barbara_available_interval_start t930)
    (barbara_available_interval_start t1000)
    (barbara_available_interval_start t1030)
    (barbara_available_interval_start t1100)
  )

  (:goal
    (and
      (met_90 barbara)
    )
  )
)