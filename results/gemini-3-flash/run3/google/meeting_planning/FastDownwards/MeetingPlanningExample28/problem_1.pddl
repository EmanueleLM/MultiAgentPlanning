(define (problem sf_meeting)
  (:domain meeting_planning)
  (:objects
    union_square chinatown - location
    t_0900 t_0907 t_1800 t_1915 - time
    joshua - person
  )
  (:init
    (at union_square)
    (current_time t_0900)
    (can_travel union_square chinatown t_0900 t_0907)
    (can_wait chinatown t_0907 t_1800)
    (can_meet joshua chinatown t_1800 t_1915)
  )
  (:goal (and (has_met joshua)))
)