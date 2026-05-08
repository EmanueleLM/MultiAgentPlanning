(define (problem san_francisco_day_visit_instance)
  (:domain san_francisco_day_visit)

  (:objects
    bayview chinatown - location
    jason - person
    t_0900 t_0918 t_1048 t_1230 - timepoint
  )

  (:init
    (at bayview)
    (current_time t_0900)

    (travel_edge bayview chinatown)
    (travel_edge chinatown bayview)

    (travel_arrival bayview chinatown t_0900 t_0918)

    (available_from jason t_0918)
    (available_until jason t_1048)

    (meeting_slot jason chinatown t_0918 t_1048)
  )

  (:goal
    (and
      (met jason)
      (at chinatown)
      (current_time t_1048)
    )
  )
)