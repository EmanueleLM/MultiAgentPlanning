(define (problem san_francisco_meeting_matthew_instance)
  (:domain san_francisco_meeting_matthew)

  (:objects
    you - traveler
    matthew - person
    nob_hill presidio - location
    t_900 t_917 t_1100 t_1130 t_1515 - time
  )

  (:init
    (at you nob_hill)
    (person_at matthew presidio)
    (current_time t_900)

    (connected nob_hill presidio)
    (connected presidio nob_hill)

    (travel_arrives nob_hill presidio t_900 t_917)

    (next_time t_917 t_1100)
    (next_time t_1100 t_1130)
    (next_time t_1130 t_1515)

    (available_at matthew t_1100)
    (available_at matthew t_1130)
    (available_at matthew t_1515)

    (meeting_30_from_to matthew t_1100 t_1130)
  )

  (:goal
    (and
      (met matthew)
    )
  )
)