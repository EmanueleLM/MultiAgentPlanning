(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    t_0900 t_0916 t_0917 t_0933 t_1330 t_1345 t_1413 t_1414 t_1415 t_1430 - time
  )

  (:init
    (at alamo_square)
    (current_time t_0900)

    (connected alamo_square sunset_district)
    (connected sunset_district alamo_square)

    (next_time t_0900 t_0916)
    (next_time t_0916 t_0917)
    (next_time t_0917 t_0933)
    (next_time t_0933 t_1330)
    (next_time t_1330 t_1345)
    (next_time t_1345 t_1413)
    (next_time t_1413 t_1414)
    (next_time t_1414 t_1415)
    (next_time t_1415 t_1430)

    (travel_arrives alamo_square sunset_district t_0900 t_0916)
    (travel_arrives alamo_square sunset_district t_1414 t_1430)
    (travel_arrives sunset_district alamo_square t_0916 t_0933)

    (available_to_meet matthew sunset_district t_1330 t_1345)
    (available_to_meet matthew sunset_district t_1415 t_1430)
  )

  (:goal
    (and
      (met matthew)
    )
  )
)