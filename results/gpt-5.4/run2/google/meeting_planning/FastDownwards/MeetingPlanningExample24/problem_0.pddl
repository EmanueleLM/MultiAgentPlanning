(define (problem meet_matthew_specific_instance)
  (:domain meet_matthew_san_francisco_day)

  (:objects
    you - traveler
    matthew - friend
    nob_hill presidio - location
    t0900 t1043 t1100 t1130 t1515 - time
  )

  (:init
    (at you nob_hill)
    (at matthew presidio)
    (current_time t0900)

    (next_time t0900 t1043)
    (next_time t1043 t1100)
    (next_time t1100 t1130)
    (next_time t1130 t1515)

    (connected_depart_arrive nob_hill presidio t1043 t1100)

    (available matthew presidio t1100 t1515)
  )

  (:goal
    (and
      (met_minimum matthew)
      (current_time t1130)
      (at you presidio)
    )
  )
)