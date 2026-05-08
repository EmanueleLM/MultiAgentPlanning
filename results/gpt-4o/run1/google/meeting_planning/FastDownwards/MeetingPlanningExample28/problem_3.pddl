(define (problem meet_joshua_problem)
  (:domain meet_joshua)

  (:objects 
    union_square chinatown - location
    t_9am t_9_07am t_6pm t_7_15pm t_8pm t_9_30pm - timepoint
  )

  (:init
    (at_self union_square)
    (current_time t_9am)
    (at_joshua chinatown t_6pm)
    (at_joshua chinatown t_7_15pm)
    (at_joshua chinatown t_8pm)
    (at_joshua chinatown t_9_30pm)
    (connected union_square chinatown)
    (connected chinatown union_square)
    (time_before t_9am t_6pm)
    (time_before t_6pm t_7_15pm)
    (time_before t_7_15pm t_8pm)
    (time_before t_8pm t_9_30pm)
    (time_before t_9_07am t_6pm)
  )

  (:goal 
    (and
      (visited joshua)
      (current_time t_9_30pm)
    )
  )
)