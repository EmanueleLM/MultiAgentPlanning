(define (problem san_francisco_sarah_meeting_instance)
  (:domain san_francisco_sarah_meeting)

  (:objects
    richmond_district presidio - location
    sarah - person
    t_900 t_1315 t_1500 t_1515 - timepoint
  )

  (:init
    (at richmond_district)
    (current_time t_900)

    (next_time t_900 t_1315)
    (next_time t_1315 t_1500)
    (next_time t_1500 t_1515)

    (connected richmond_district presidio)
    (connected presidio richmond_district)

    (person_at sarah presidio)

    (available sarah t_1315)
    (available sarah t_1500)
    (available sarah t_1515)
  )

  (:goal
    (and
      (met_minimum sarah)
    )
  )
)