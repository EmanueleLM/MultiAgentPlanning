(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    you - agent
    deborah - person
    the_castro sunset_district - location
    t_0900 t_0917 t_1415 t_1530 t_1845 t_2000 - timepoint
  )

  (:init
    (at you the_castro)
    (person_at deborah sunset_district)
    (current_time t_0900)

    (wait_step t_0917 t_1415)
    (wait_step t_1415 t_1845)
    (wait_step t_1530 t_1845)
    (wait_step t_1845 t_2000)

    (travel_step the_castro sunset_district t_0900 t_0917)

    (available_to_meet deborah t_1415)
    (available_to_meet deborah t_1845)

    (meeting_start_ok_75 deborah t_1415)
    (meeting_start_ok_75 deborah t_1845)

    (meeting_step_75 deborah t_1415 t_1530)
    (meeting_step_75 deborah t_1845 t_2000)
  )

  (:goal
    (and
      (met_minimum deborah)
    )
  )
)