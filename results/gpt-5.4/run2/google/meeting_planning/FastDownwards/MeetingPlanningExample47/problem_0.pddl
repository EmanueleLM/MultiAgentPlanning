(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    you - traveler
    paul - person
    richmond_district nob_hill - location
    t900 t917 t930 t945 t1115 - time
  )

  (:init
    (at you richmond_district)
    (current_time t900)

    (travel_edge richmond_district nob_hill t900 t917)

    (next_time t917 t930)
    (next_time t930 t945)
    (next_time t945 t1115)

    (available paul nob_hill t930 t1115)

    (minimum_meeting_step paul t930 t945)
  )

  (:goal
    (and
      (met paul)
    )
  )
)