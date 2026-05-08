(define (problem san_francisco_meet_stephanie_instance)
  (:domain san_francisco_meet_stephanie)

  (:objects
    chinatown marina_district - location
    stephanie - person
    t_0900 t_0912 t_1057 t_1500 - timepoint
  )

  (:init
    (at chinatown)
    (current_time t_0900)

    (travel_12 chinatown marina_district)

    (next_12 t_0900 t_0912)
    (next_105 t_0912 t_1057)

    (available stephanie t_0900)
    (available stephanie t_0912)
    (available stephanie t_1057)
  )

  (:goal
    (and
      (met_minimum stephanie)
    )
  )
)