(define (problem meeting_planning_instance)
  (:domain meeting_planning)
  (:objects
    me margaret - person
    union_square north_beach - location
    t_0900 t_2135 t_2145 t_2230 - time
  )
  (:init
    (at me union_square)
    (at margaret north_beach)
    (current_time t_0900)
    (next t_0900 t_2135)
    (dist_10 t_2135 t_2145)
    (dist_45 t_2145 t_2230)
  )
  (:goal
    (met margaret)
  )
)