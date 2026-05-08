(define (problem meet_betty_problem)
  (:domain meet_friends_sf)
  (:objects 
    pacific_heights fishermans_wharf - location
    you betty - person
    stage_t1 stage_t2 stage_t3 - stage
  )

  (:init 
    (at you pacific_heights)
    (at betty fishermans_wharf)
    (stage_reached stage_t1)
  )

  (:goal 
    (visited betty)
  )
)