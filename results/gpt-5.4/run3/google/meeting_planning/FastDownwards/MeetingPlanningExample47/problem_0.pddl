(define (problem san_francisco_meet_paul_instance)
  (:domain san_francisco_meet_paul)

  (:objects
    richmond_district nob_hill - location
    paul - person
    t_900 t_930 t_1100 t_1115 - time
  )

  (:init
    (at richmond_district)
    (current_time t_900)

    (connected richmond_district nob_hill)
    (connected nob_hill richmond_district)

    (travel_900_to_930 richmond_district nob_hill)
    (travel_900_to_930 nob_hill richmond_district)

    (travel_900_to_1100 richmond_district nob_hill)
    (travel_900_to_1100 nob_hill richmond_district)

    (travel_930_to_1100 richmond_district nob_hill)
    (travel_930_to_1100 nob_hill richmond_district)

    (travel_930_to_1115 richmond_district nob_hill)
    (travel_930_to_1115 nob_hill richmond_district)

    (next_time t_900 t_930)
    (next_time t_930 t_1100)
    (next_time t_1100 t_1115)

    (paul_available_start paul t_930)
    (paul_available_end paul t_1115)
    (valid_meeting_start paul t_930)
    (valid_meeting_start paul t_1100)
  )

  (:goal
    (and
      (met paul)
    )
  )
)