(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    the_castro sunset_district - location
    deborah - person
    t_0900 t_1415 t_1530 t_2000 - time
  )

  (:init
    (at the_castro)
    (current_time t_0900)

    (connected the_castro sunset_district)
    (connected sunset_district the_castro)

    (next_time t_0900 t_1415)
    (next_time t_1415 t_1530)
    (next_time t_1530 t_2000)

    (deborah_available t_1415)
    (deborah_available t_1530)

    (meeting_start deborah sunset_district t_1415)
    (meeting_end deborah t_1530)

    (travel_slot the_castro sunset_district t_0900 t_1415)
  )

  (:goal
    (and
      (met deborah)
    )
  )
)