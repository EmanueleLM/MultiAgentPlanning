(define (problem visit_sf_problem)
  (:domain visit_sf)
  (:objects 
    haight_ashbury north_beach - location
    robert - person)
  (:init 
    (at haight_ashbury))
  (:goal 
    (meet_target_achieved))
)