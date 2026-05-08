(define (domain sf_meeting_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person)
  
  (:predicates
    (at ?person - person ?location - location)
    (can_meet ?person - person)
    (visited ?location - location)
    (scheduled_meeting ?person - person)
    (started_meeting ?person - person)
    (ended_meeting ?person - person)
    (completed_schedule)
  )
  
  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and (at you ?from) (not (at you ?to)))
    :effect (and (not (at you ?from)) (at you ?to) (visited ?to))
  )
  
  (:action start_meeting
    :parameters (?person - person ?location - location)
    :precondition (and (at you ?location) (at ?person ?location) 
                      (can_meet ?person) (not (scheduled_meeting ?person)))
    :effect (and (scheduled_meeting ?person) (started_meeting ?person))
  )
  
  (:action end_meeting
    :parameters (?person - person ?location - location)
    :precondition (and (started_meeting ?person) 
                      (at ?person ?location) (at you ?location))
    :effect (ended_meeting ?person)
  )
  
  (:action complete_schedule
    :precondition (ended_meeting barbara)
    :effect (completed_schedule)
  )
)