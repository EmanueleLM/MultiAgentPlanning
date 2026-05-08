(define (problem san_francisco_meeting_instance_problem)
  (:domain san_francisco_meeting_instance)

  (:objects
    richmond_district presidio - location
    sarah - person
    t900 t1308 t1315 t1500 t1515 - time
  )

  (:init
    (at richmond_district)
    (current_time t900)

    (connected richmond_district presidio)
    (connected presidio richmond_district)

    (next_time t900 t1308)
    (next_time t1308 t1315)
    (next_time t1315 t1500)
    (next_time t1500 t1515)

    (travel_step richmond_district presidio t1308 t1315)

    (available sarah presidio t1315)
    (available sarah presidio t1500)
    (available sarah presidio t1515)
  )

  (:goal
    (and
      (meeting_completed sarah)
      (current_time t1500)
      (at presidio)
    )
  )
)