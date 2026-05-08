(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    north_beach haight_ashbury - location
    t_0900 t_0918 t_1003 - time
    george - person
  )
  (:init
    (at north_beach)
    (time_at t_0900)
    (can_travel north_beach haight_ashbury t_0900 t_0918)
    (can_meet george haight_ashbury t_0918 t_1003)
    (available george t_0918)
    (available george t_1003)
  )
  (:goal (met george))
)