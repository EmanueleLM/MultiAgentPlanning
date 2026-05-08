(define (problem san_francisco_timothy_day_instance)
  (:domain san_francisco_timothy_day)

  (:objects
    nob_hill presidio - location
    timothy - person
    t_0900 t_0917 t_1300 t_1330 t_1900 - timepoint
  )

  (:init
    (at nob_hill)
    (current_time t_0900)

    (timothy_at presidio)

    (route_17 nob_hill presidio)
    (after_17 t_0900 t_0917)

    (next_time t_0917 t_1300)
    (next_time t_1330 t_1900)

    (meeting_window_start timothy t_1300)
    (meeting_window_end timothy t_1900)
    (thirty_min_later t_1300 t_1330)
  )

  (:goal
    (and
      (met timothy)
      (current_time t_1330)
      (at presidio)
    )
  )
)