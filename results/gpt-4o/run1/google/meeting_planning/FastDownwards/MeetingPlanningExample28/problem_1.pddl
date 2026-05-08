(define (problem p1)
  (:domain meet_joshua)
  (:objects 
    union_square chinatown - location
    joshua - friend
    t_9am t_9_07am t_6pm t_6_07pm t_7_15pm t_8pm t_9pm t_9_30pm - timepoint
  )

  (:init
    (at_self union_square t_9am)
    (visited union_square t_9am)
    (at_joshua chinatown)
    (consecutive_time t_9am t_9_07am)
    (consecutive_time t_6pm t_6_07pm)
    (consecutive_time t_7_15pm t_8pm)
    (consecutive_time t_8pm t_9pm)
    (consecutive_time t_9pm t_9_30pm)
  )

  (:goal 
    (exists (?start - timepoint ?end - timepoint)
      (and
        (can_meet chinatown ?start ?end)
        (not (can_meet chinatown t_6pm t_7_15pm))
        (not (can_meet chinatown t_8pm t_9pm))
        (can_meet chinatown t_6_07pm t_7_15pm)
      )
    )
  )
)