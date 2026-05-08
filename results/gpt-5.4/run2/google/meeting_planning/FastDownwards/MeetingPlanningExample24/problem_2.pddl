(define (problem meetingplanningexample24_problem)
  (:domain meetingplanningexample24_domain)

  (:objects
    nob_hill presidio - location
    t0900 t1043 t1100 t1130 t1148 t1515 - time
  )

  (:init
    (at_traveler nob_hill)
    (current_time t0900)

    (next t0900 t1043)
    (next t1043 t1100)
    (next t1100 t1130)
    (next t1130 t1148)
    (next t1148 t1515)

    (travel_edge nob_hill presidio t1043 t1100)
    (travel_edge presidio nob_hill t1130 t1148)

    (friend_window matthew presidio t1100 t1130)
  )

  (:goal
    (and
      (met matthew)
      (current_time t1130)
      (at_traveler presidio)
    )
  )
)