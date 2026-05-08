(define (problem meet_betty_problem)
  (:domain meet_friends_sf)
  (:objects 
    pacific_heights fishermans_wharf - location
    you betty - person
    t9_00 t9_13 t9_45 t11_00 t12_45 t5_00 t5_12 - time
  )
  (:init 
    (at you pacific_heights)
    (at betty fishermans_wharf)
    (can_meet betty fishermans_wharf t11_00)
    (can_meet betty fishermans_wharf t12_45)
    (have_time t9_00)
  )
  (:goal 
    (and 
      (visited betty)
    )
  )
)