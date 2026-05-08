(define (domain san_francisco_scheduling)
  (:requirements :strips :typing)
  (:types
    location 
    person 
    stage)
  (:predicates
    (at ?person - person ?location - location)
    (visited ?location - location)
    (met ?person - person)
    (can_travel_to ?from - location ?to - location)
    (current_time_stage ?stage - stage)
  )
  
  (:action travel
    :parameters (?self - person ?from - location ?to - location ?current_stage - stage ?next_stage - stage)
    :precondition (and 
                   (at ?self ?from)
                   (can_travel_to ?from ?to)
                   (current_time_stage ?current_stage))
    :effect (and
             (not (at ?self ?from))
             (at ?self ?to)
             (not (current_time_stage ?current_stage))
             (current_time_stage ?next_stage))
  )

  (:action meet_andrew
    :parameters (?self - person ?location - location ?start_stage - stage ?end_stage - stage)
    :precondition (and 
                   (at ?self ?location)
                   (current_time_stage ?start_stage))
    :effect (and 
             (met andrew)
             (not (current_time_stage ?start_stage))
             (current_time_stage ?end_stage)
             (visited ?location))
  )
)