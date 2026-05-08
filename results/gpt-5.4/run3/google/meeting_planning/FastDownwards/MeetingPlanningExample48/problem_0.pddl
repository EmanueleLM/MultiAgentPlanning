(define (problem san_francisco_meeting_instance_problem)
  (:domain san_francisco_meeting_instance)

  (:objects
    you - traveler
    joseph - person
    financial_district union_square - location
    t_0900 t_2100 t_2109 t_2130 t_2145 t_2200 - timepoint
  )

  (:init
    (at you financial_district)
    (current_time t_0900)

    (next_time t_0900 t_2100)
    (next_time t_2109 t_2130)
    (next_time t_2130 t_2145)
    (next_time t_2145 t_2200)

    (travel_slot financial_district t_2100 union_square t_2109)
    (travel_slot union_square t_2100 financial_district t_2109)

    (can_meet_15 joseph union_square t_2130 t_2145)
  )

  (:goal
    (and
      (met_minimum joseph)
    )
  )
)