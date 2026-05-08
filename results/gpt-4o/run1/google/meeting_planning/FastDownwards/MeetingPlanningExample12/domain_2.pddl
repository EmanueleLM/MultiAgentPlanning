(define (domain sf_meeting_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person)
  
  (:predicates
    (at ?person - person ?location - location)
    (can_meet ?friend - person)
    (scheduled_meeting ?friend - person)
    (started_meeting ?friend - person)
    (ended_meeting ?friend - person)
    (meeting_goal_achieved)
  )
  
  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and (at you ?from) (not (at you ?to)))
    :effect (and (not (at you ?from)) (at you ?to))
  )
  
  (:action start_meeting
    :parameters (?friend - person ?location - location)
    :precondition (and (at you ?location) (at ?friend ?location) 
                       (can_meet ?friend) (not (scheduled_meeting ?friend)))
    :effect (scheduled_meeting ?friend)
  )
  
  (:action end_meeting
    :parameters (?friend - person ?location - location)
    :precondition (and (scheduled_meeting ?friend) (at ?friend ?location) 
                       (at you ?location))
    :effect (and (ended_meeting ?friend) 
                 (not (scheduled_meeting ?friend)))
  )
  
  (:action achieve_meeting_goal
    :precondition (ended_meeting barbara)
    :effect (meeting_goal_achieved)
  )
)