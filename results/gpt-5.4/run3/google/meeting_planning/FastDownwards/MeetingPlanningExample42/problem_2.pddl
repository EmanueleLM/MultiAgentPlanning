(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    nob_hill presidio - location
    timothy - person
    t0900 t0917 t1300 t1330 t1900 - time
  )

  (:init
    (at nob_hill)
    (current_time t0900)

    (next_time t0900 t0917)
    (next_time t0917 t1300)
    (next_time t1300 t1330)
    (next_time t1330 t1900)

    (travel_nob_hill_to_presidio t0900 t0917)
    (travel_presidio_to_nob_hill t0917 t0900)

    (available_start timothy t1300)
    (available_end timothy t1900)

    (meeting_slot_timothy t1300 t1330)
  )

  (:goal
    (and
      (met timothy)
      (current_time t1330)
      (at presidio)
    )
  )
)