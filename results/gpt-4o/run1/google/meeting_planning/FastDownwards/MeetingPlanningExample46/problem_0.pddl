(define (problem visit_sf_problem)
  (:domain visit_sf)
  (:objects 
    haight_ashbury north_beach - location
    robert - person
    t0 t2 t3 t4 t5 t6 - time
  )
  (:init 
    (at haight_ashbury)
    (time t0)
    (time t2)
    (time t3)
    (time t4)
    (time t5)
    (time t6)
  )
  (:goal 
    (and (meet_target_achieved))
  )
)