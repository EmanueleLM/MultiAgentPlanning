(define (problem san_francisco_meet_paul_instance)
  (:domain san_francisco_meet_paul)

  (:objects
    richmond_district nob_hill - location
    paul - person
    t900 t930 t1100 t1115 - time
  )

  (:init
    (at richmond_district)
    (current_time t900)

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

    (next_time t900 t930)
    (next_time t930 t1100)
    (next_time t1100 t1115)

    (paul_available_start paul t930)
    (paul_available_end paul t1115)
    (valid_meeting_start paul t930)
    (valid_meeting_start paul t1100)
  )

  (:goal
    (and
      (met paul)
    )
  )
)