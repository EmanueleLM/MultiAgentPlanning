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

    (valid_meeting_start paul t930)
    (valid_meeting_start paul t1100)
  )

  (:goal
    (and
      (met paul)
    )
  )
)