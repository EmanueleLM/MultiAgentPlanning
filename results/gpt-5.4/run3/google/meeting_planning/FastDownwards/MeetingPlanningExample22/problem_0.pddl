(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    you - agent
    andrew - friend
    presidio union_square - location
    t_900 t_922 t_924 t_1115 t_1300 t_1715 - time
  )

  (:init
    (at you presidio)
    (friend_at andrew union_square)
    (current_time t_900)

    (can_travel presidio union_square t_900 t_922)

    (next t_900 t_922)
    (next t_922 t_1115)
    (next t_1115 t_1300)
    (next t_1300 t_1715)

    (available andrew t_1115)
    (available andrew t_1300)
    (available andrew t_1715)

    (can_meet_min andrew union_square t_1115 t_1300)
  )

  (:goal
    (and
      (met_min andrew)
      (at you union_square)
      (current_time t_1300)
    )
  )
)