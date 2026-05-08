(define (problem meet_friend_sf_instance_problem)
  (:domain meet_friend_sf_instance)

  (:objects
    nob_hill alamo_square - location
    anthony - person
    t900 t911 t926 t1300 - time
  )

  (:init
    (at nob_hill)
    (current_time t900)

    (travel_edge nob_hill alamo_square t900 t911)

    (available_for_meeting anthony alamo_square t911 t926)
  )

  (:goal
    (and
      (met anthony)
      (at alamo_square)
      (current_time t926)
    )
  )
)