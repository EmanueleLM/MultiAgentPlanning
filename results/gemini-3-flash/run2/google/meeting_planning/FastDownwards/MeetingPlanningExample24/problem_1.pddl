(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    nob_hill presidio - location
    t_0900 t_0917 t_1100 t_1130 - time
    matthew - person
  )
  (:init
    (at_me nob_hill)
    (current_time t_0900)
    (can_travel nob_hill presidio t_0900 t_0917)
    (can_wait presidio t_0917 t_1100)
    (person_at matthew presidio t_1100 t_1130)
  )
  (:goal (met matthew))
)