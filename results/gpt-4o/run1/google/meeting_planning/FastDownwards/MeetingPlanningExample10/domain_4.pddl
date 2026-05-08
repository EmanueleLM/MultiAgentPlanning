```
(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time_stage
  )
  (:predicates
    (at ?loc - location)
    (at_time ?t - time_stage)
    (can_meet_james)
    (met_james)
  )
  (:action move_to_marina_district
    :parameters ()
    :precondition (and (at golden_gate_park) (at_time stage_9am))
    :effect (and (not (at golden_gate_park)) (at marina_district) (not (at_time stage_9am)) (at_time stage_1015am))
  )
  (:action wait_for_james
    :parameters ()
    :precondition (and (at marina_district) (at_time stage_1015am))
    :effect (and (not (at_time stage_1015am)) (at_time stage_1030am) (can_meet_james))
  )
  (:action meet_james
    :parameters ()
    :precondition (and (at marina_district) (can_meet_james) (at_time stage_1030am))
    :effect (and (met_james) (not (can_meet_james)) (not (at_time stage_1030am)) (at_time stage_1045am))
  )
)
```