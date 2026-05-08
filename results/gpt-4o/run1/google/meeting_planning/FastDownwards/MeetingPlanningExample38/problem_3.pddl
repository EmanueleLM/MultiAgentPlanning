(define (problem meet_margaret_in_san_francisco)
  (:domain san_francisco_visit)
  (:objects 
    union_square north_beach - location
    margaret myself - person
    stage_0 stage_1 stage_2 stage_3 stage_4 - time_stage
  )
  (:init 
    (at myself union_square)
    (not (met_margaret))
    (available_for_meeting margaret north_beach stage_2)
    (at_stage stage_0)
  )
  (:goal (and 
    (met_margaret)
    (at myself union_square)
    (at_stage stage_4)
  ))
)