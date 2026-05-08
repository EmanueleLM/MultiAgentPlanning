(define (problem san_francisco_meeting_instance_problem)
  (:domain san_francisco_meeting_instance)

  (:objects
    richmond_district north_beach - location
    stephanie - person
    t_0900 t_0917 t_0930 t_1130 t_1615 - timepoint
  )

  (:init
    (at richmond_district)
    (current_time t_0900)

    (connected richmond_district north_beach)
    (connected north_beach richmond_district)

    (travel_link richmond_district north_beach t_0900 t_0917)

    (next_time t_0900 t_0917)
    (next_time t_0917 t_0930)
    (next_time t_0930 t_1130)
    (next_time t_1130 t_1615)

    (person_at stephanie north_beach)
    (available_from_to stephanie t_0930 t_1615)
    (minimum_meeting_block stephanie north_beach t_0930 t_1130)
  )

  (:goal
    (and
      (met_minimum stephanie)
      (current_time t_1130)
      (at north_beach)
    )
  )
)