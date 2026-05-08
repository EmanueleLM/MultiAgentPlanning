(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    you - traveler
    nob_hill presidio - location
    t0900 t1300 t1317 t1347 t1900 - time
  )

  (:init
    (at you nob_hill)
    (time_now t0900)

    (next t0900 t1300)
    (next t1300 t1317)
    (next t1317 t1347)
    (next t1347 t1900)

    (travel nob_hill presidio t1300 t1317)

    (available_timothy presidio t1317 t1347)
    (available_timothy presidio t1347 t1900)
  )

  (:goal
    (and
      (met_timothy_minimum)
    )
  )
)