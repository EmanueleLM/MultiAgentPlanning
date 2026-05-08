(define (problem san_francisco_day_meeting_mary_instance)
  (:domain san_francisco_day_meeting_mary)

  (:objects
    union_square nob_hill - location
    mary - person
    t0900 t0907 t0909 t1200 t1315 t1615 - timepoint
  )

  (:init
    (at union_square)
    (current_time t0900)

    (next t0900 t0907)
    (next t0907 t0909)
    (next t0909 t1200)
    (next t1200 t1315)
    (next t1315 t1615)

    (travel_link union_square nob_hill t0900 t0909)
    (travel_link union_square nob_hill t1200 t1315)
    (travel_link nob_hill union_square t0900 t0907)

    (available_start mary nob_hill t1200)
    (meeting_end mary t1200 t1315)
    (available_until mary t1615)
  )

  (:goal
    (and
      (met mary)
    )
  )
)