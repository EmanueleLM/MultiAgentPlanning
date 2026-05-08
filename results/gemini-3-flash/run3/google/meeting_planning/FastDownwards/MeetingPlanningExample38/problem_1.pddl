(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    t_0900 t_2145 t_2230 - time
  )
  (:init
    (at union_square)
    (time_at t_0900)
    (= (total-cost) 0)
  )
  (:goal (met_margaret))
  (:metric minimize (total-cost))
)