(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    you - traveler
    nob_hill presidio - location
    timothy - person
    t0900 t1300 t1317 t1347 t1900 - time
  )

  (:init
    (at you nob_hill)
    (friend_at timothy presidio)

    (time_now t0900)

    (next t0900 t1300)
    (next t1300 t1317)
    (next t1317 t1347)
    (next t1347 t1900)

    (available timothy t1300 t1900)

    (person_present timothy t1300)
    (person_present timothy t1317)
    (person_present timothy t1347)
    (person_present timothy t1900)

    (travel_edge nob_hill presidio t1300 t1317)

    (minimum_completion timothy t1317 t1347)
  )

  (:goal
    (and
      (met_minimum timothy)
    )
  )
)