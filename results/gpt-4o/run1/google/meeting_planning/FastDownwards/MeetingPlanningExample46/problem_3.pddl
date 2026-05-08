(define (problem visit_sf_problem)
  (:domain visit_sf)
  (:objects 
    haight_ashbury north_beach - location
    robert - person
    nine_am nine_nineteen nine_thirty_seven four_thirty_pm six_pm - timepoint)
  (:init 
    (at haight_ashbury)
    (at_time nine_am))
  (:goal 
    (meet_target_achieved))
)