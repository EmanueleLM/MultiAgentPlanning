(define (problem sf_meet_joseph_instance)
  (:domain sf_meet_joseph)

  (:init
    (at you chinatown)
    (current_time t_0900)

    (connected chinatown nob_hill)
    (connected nob_hill chinatown)

    (next_time t_0900 t_1100)
    (next_time t_1100 t_1130)
    (next_time t_1130 t_1245)
    (next_time t_1245 t_1515)

    (friend_at joseph nob_hill)
    (available_at joseph t_1130)
    (available_at joseph t_1245)
    (available_at joseph t_1515)
  )

  (:goal
    (and
      (met_minimum joseph)
      (at you nob_hill)
      (current_time t_1245)
    )
  )
)