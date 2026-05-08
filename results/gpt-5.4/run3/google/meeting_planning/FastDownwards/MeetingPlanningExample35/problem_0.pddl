(define (problem meet_jason_specific_instance)
  (:domain meet_jason_san_francisco_day)

  (:objects
    you - traveler
    jason - person
    bayview chinatown - location
    t_0900 t_0918 t_1048 t_1230 - time
  )

  (:init
    (at you bayview)
    (current_time t_0900)

    (travel_edge bayview chinatown)
    (travel_edge chinatown bayview)

    (travel_arrives bayview chinatown t_0900 t_0918)

    (meeting_slot jason chinatown t_0918 t_1048)
  )

  (:goal
    (and
      (met jason)
    )
  )
)