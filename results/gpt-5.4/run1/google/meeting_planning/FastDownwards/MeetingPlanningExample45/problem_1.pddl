(define (problem san_francisco_meet_emily_instance)
  (:domain san_francisco_meet_emily)

  (:objects
    north_beach alamo_square - location
    t_0900 t_0916 t_1945 t_2100 - time
  )

  (:init
    (at north_beach)
    (current_time t_0900)

    (person_at emily alamo_square)

    (wait_edge t_0916 t_1930)
    (wait_edge t_1945 t_2100)

    (travel_edge north_beach alamo_square t_0900 t_0916)

    (can_start_meeting emily t_1930)
    (meeting_15_edge emily t_1930 t_1945)
  )

  (:goal
    (and
      (met emily)
    )
  )
)