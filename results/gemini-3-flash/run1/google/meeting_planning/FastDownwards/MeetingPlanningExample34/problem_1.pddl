(define (problem meeting_thomas)
  (:domain meeting_planning)
  (:objects
    bayview pacific_heights - location
    t_0900 t_0923 t_1215 t_1400 t_1422 - time
  )
  (:init
    (at_location bayview)
    (current_time t_0900)
    (can_wait t_0923 t_1215)
  )
  (:goal
    (has_met_thomas)
  )
)