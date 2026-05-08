(define (problem san_francisco_meet_jason_instance)
  (:domain san_francisco_meet_jason)

  (:objects
    bayview chinatown - location
    jason - person
    t0900 t0918 t1030 t1048 t1200 t1218 t1230 - timepoint
  )

  (:init
    (at bayview)
    (current_time t0900)

    (connected bayview chinatown)
    (connected chinatown bayview)

    (travel_slot bayview chinatown t0900 t0918)

    (wait_slot chinatown t0918 t1030)

    (available_for_meeting jason chinatown t0918 t1048)
    (available_for_meeting jason chinatown t1030 t1200)
  )

  (:goal
    (and
      (met_minimum jason)
    )
  )
)