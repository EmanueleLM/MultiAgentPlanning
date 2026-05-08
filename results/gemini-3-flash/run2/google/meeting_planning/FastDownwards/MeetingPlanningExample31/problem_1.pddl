(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    nob_hill alamo_square - location
    anthony - person
    t_0900 t_0911 t_0926 - time
  )
  (:init
    (at nob_hill)
    (current_time t_0900)
    (can_travel nob_hill alamo_square t_0900 t_0911)
    (can_meet anthony alamo_square t_0911 t_0926)
  )
  (:goal (and (met anthony)))
)