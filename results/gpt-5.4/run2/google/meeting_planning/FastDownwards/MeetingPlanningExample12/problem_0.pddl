(define (problem meet_barbara_specific_instance)
  (:domain meet_barbara_san_francisco)

  (:objects
    north_beach alamo_square - location
    barbara - person
    t0900 t_pre1800 t1800 t1900 t1930 t2130 - time
  )

  (:init
    (at north_beach)
    (current_time t0900)
    (person_at barbara alamo_square)
    (travel_16 north_beach alamo_square)
    (travel_15 alamo_square north_beach)
  )

  (:goal
    (and
      (met_required_90 barbara)
      (at alamo_square)
      (current_time t1930)
    )
  )
)