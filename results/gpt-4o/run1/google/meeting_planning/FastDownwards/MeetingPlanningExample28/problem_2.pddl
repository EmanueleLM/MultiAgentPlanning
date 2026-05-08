(define (problem p1)
  (:domain meet_joshua)
  (:objects 
    union_square chinatown - location
    t_9am t_9_07am t_6pm t_7_15pm t_8pm t_9_30pm - timepoint
  )

  (:init
    (at_self union_square t_9am)
    (at_joshua chinatown t_6pm)
    (at_joshua chinatown t_7_15pm)
    (at_joshua chinatown t_8pm)
    (at_joshua chinatown t_9_30pm)
    (connected union_square chinatown)
    (connected chinatown union_square)
    (time_after t_9_07am t_9am)
    (time_after t_7_15pm t_6pm)
    (time_after t_8pm t_7_15pm)
    (time_after t_9_30pm t_8pm)
  )

  (:goal 
    (exists (?time1 ?time2 ?time3 - timepoint)
      (and
        (can_meet_joshua ?time1)
        (can_meet_joshua ?time2)
        (can_meet_joshua ?time3)
        (time_after ?time3 t_7_15pm)
        (time_after ?time3 ?time2)
        (time_after ?time2 t_6pm)
        (time_after ?time2 ?time1)
        (time_after ?time1 t_6pm)
      )
    )
  )
)