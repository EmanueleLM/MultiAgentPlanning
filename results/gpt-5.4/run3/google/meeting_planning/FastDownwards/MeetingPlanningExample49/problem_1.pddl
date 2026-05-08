(define (problem meet_sarah_specific_instance)
  (:domain meet_sarah_san_francisco_day)

  (:objects
    richmond_district bayview - location
    sarah - person
    t_9_00 t_9_25 t_9_26 t_14_15 t_15_00 t_17_30 - time
  )

  (:init
    (at richmond_district)
    (current_time t_9_00)

    (can_travel richmond_district bayview)
    (can_travel bayview richmond_district)

    (next_time t_9_00 t_9_25)
    (next_time t_9_25 t_9_26)
    (next_time t_9_26 t_14_15)
    (next_time t_14_15 t_15_00)
    (next_time t_15_00 t_17_30)

    (travel_arrives richmond_district bayview t_9_00 t_9_26)
    (travel_arrives bayview richmond_district t_9_00 t_9_25)

    (available_for_meeting sarah t_14_15 t_15_00)
  )

  (:goal
    (and
      (met sarah)
    )
  )
)