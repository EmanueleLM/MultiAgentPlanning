(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    richmond_district bayview - location
    sarah - person
    t9_00 t9_25 t9_26 t14_15 t15_00 t17_30 - time
  )

  (:init
    (at richmond_district)
    (current_time t9_00)
    (person_at sarah bayview)

    (connected richmond_district bayview)
    (connected bayview richmond_district)

    (travel_time_from_t9_00 richmond_district bayview t9_26)
    (travel_time_from_t9_00 bayview richmond_district t9_25)

    (next_time t9_00 t9_25)
    (next_time t9_25 t9_26)
    (next_time t9_26 t14_15)
    (next_time t14_15 t15_00)
    (next_time t15_00 t17_30)

    (available_at sarah bayview t14_15 t17_30)
  )

  (:goal
    (and
      (met sarah)
    )
  )
)