(define (problem san_francisco_barbara_day_instance)
  (:domain san_francisco_barbara_day)

  (:objects
    bayview golden_gate_park - location
    t0900 t0922 t1000 t1130 - timepoint
  )

  (:init
    (at bayview)
    (current_time t0900)
    (connected bayview golden_gate_park)
    (connected golden_gate_park bayview)
    (travel_bayview_to_golden_gate_park_possible_at t0900 t0922)
    (barbara_available_at t0900)
    (barbara_available_at t0922)
    (barbara_available_at t1000)
  )

  (:goal
    (and
      (met_barbara_required)
    )
  )
)