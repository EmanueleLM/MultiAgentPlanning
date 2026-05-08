(define (problem san_francisco_joseph_meeting_instance)
  (:domain san_francisco_joseph_meeting)

  (:objects
    chinatown nob_hill - location
    joseph - person
    t_0900 t_1122 t_1130 t_1245 t_1509 t_1515 - time
  )

  (:init
    (at chinatown)
    (current_time t_0900)

    (connected chinatown nob_hill)
    (connected nob_hill chinatown)

    (travel_step chinatown nob_hill t_1122 t_1130)
    (travel_step nob_hill chinatown t_1509 t_1515)

    (wait_step chinatown t_0900 t_1122)
    (wait_step nob_hill t_1130 t_1245)
    (wait_step nob_hill t_1245 t_1509)
    (wait_step nob_hill t_1245 t_1515)

    (available joseph nob_hill t_1130 t_1515)

    (meeting_step joseph nob_hill t_1130 t_1245)
  )

  (:goal
    (and
      (met joseph)
    )
  )
)