(define (problem meet_matthew_instance)
  (:domain meet_matthew_san_francisco)

  (:objects
    alamo_square sunset_district - location
    matthew - friend
    t0900 t0916 t0933 t1330 t1345 t1430 - time
  )

  (:init
    (at alamo_square)
    (current_time t0900)

    (connected alamo_square sunset_district)
    (connected sunset_district alamo_square)

    (travel_arrives alamo_square sunset_district t0900 t0916)
    (travel_arrives sunset_district alamo_square t0916 t0933)

    (next_time t0916 t1330)
    (next_time t1330 t1345)
    (next_time t1345 t1430)

    (friend_at matthew sunset_district)
    (available matthew t1330)
    (available matthew t1345)
    (available matthew t1430)

    (meeting_start_to_finish t1330 t1345)
    (meeting_start_to_finish t1345 t1430)
  )

  (:goal
    (and
      (met matthew)
    )
  )
)