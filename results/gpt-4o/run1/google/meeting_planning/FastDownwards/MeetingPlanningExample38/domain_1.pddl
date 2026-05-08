(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time_stage)
  (:predicates
    (at ?person - person ?location - location)
    (at_stage ?stage - time_stage)
    (met_margaret)
    (available_for_meeting ?person - person ?location - location ?stage - time_stage)
    (enroute ?person - person ?start - location ?end - location)
  )
  
  (:action travel_to_north_beach
    :parameters (?p - person)
    :precondition (and (at ?p union_square) (at_stage stage_0))
    :effect (and 
      (not (at ?p union_square)) 
      (at ?p north_beach)
      (not (at_stage stage_0)) 
      (at_stage stage_1))
  )
  
  (:action meet_margaret
    :parameters (?p - person)
    :precondition (and 
      (at_stage stage_1) 
      (at ?p north_beach) 
      (available_for_meeting margaret north_beach stage_1) 
      (not (met_margaret)))
    :effect (and 
      (met_margaret) 
      (not (available_for_meeting margaret north_beach stage_1)))
  )
  
  (:action travel_from_north_beach_to_union_square_after_meeting
    :parameters (?p - person)
    :precondition (and 
      (at ?p north_beach) 
      (at_stage stage_1) 
      (met_margaret))
    :effect (and 
      (not (at ?p north_beach)) 
      (at ?p union_square) 
      (not (at_stage stage_1)) 
      (at_stage stage_2))
  )
)