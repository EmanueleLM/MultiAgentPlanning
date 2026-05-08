(define (problem meet_joshua_problem)
  (:domain meet_joshua)

  (:objects 
    union_square chinatown - location
    t_9am t_6pm t_7_15pm t_9_30pm - timepoint
  )

  (:init
    (at_self union_square)
    (current_time t_9am)
    (at_joshua chinatown)
    (connected union_square chinatown)
    (connected chinatown union_square)
    (time_before t_9am t_6pm)
    (time_before t_6pm t_7_15pm)
    (time_before t_7_15pm t_9_30pm)
  )

  (:goal 
    (and
      (visited chinatown)
      (current_time t_9_30pm)
    )
  )
)