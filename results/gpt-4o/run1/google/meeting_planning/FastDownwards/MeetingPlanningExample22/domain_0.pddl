(define (domain san_francisco_scheduling)
  (:requirements :strips :typing :negative-preconditions)
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
    (time_stage ?stage - stage)
  )
  
  (:action travel
    :parameters (?from - location ?to - location ?stage_from - stage ?stage_to - stage)
    :precondition (and 
                   (at self ?from)
                   (can_travel_to ?from ?to)
                   (current_time_stage ?stage_from)
                   )
    :effect (and
             (not (at self ?from))
             (at self ?to)
             (not (current_time_stage ?stage_from))
             (current_time_stage ?stage_to)
             )
  )

  (:action meet_andrew
    :parameters (?location - location ?start_stage - stage ?end_stage - stage)
    :precondition (and 
                   (at self ?location)
                   (at andrew ?location)
                   (current_time_stage ?start_stage)
                   )
    :effect (and 
             (met andrew)
             (not (current_time_stage ?start_stage))
             (current_time_stage ?end_stage)
             (visited ?location)
             )
  )
)