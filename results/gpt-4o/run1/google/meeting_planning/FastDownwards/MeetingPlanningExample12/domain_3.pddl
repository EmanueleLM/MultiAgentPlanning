(define (domain sf_meeting_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time_slot)

  (:predicates
    (at ?person - person ?location - location)
    (can_meet ?friend - person)
    (scheduled_meeting ?friend - person)
    (started_meeting ?friend - person)
    (ended_meeting ?friend - person)
    (meeting_goal_achieved)
    (current_time ?time - time_slot)
  )

  (:action move
    :parameters (?from - location ?to - location ?time_from - time_slot ?time_to - time_slot)
    :precondition (and (at you ?from) (not (at you ?to)) (current_time ?time_from) (not (current_time ?time_to)))
    :effect (and (not (at you ?from)) (at you ?to) (not (current_time ?time_from)) (current_time ?time_to))
  )

  (:action start_meeting
    :parameters (?friend - person ?location - location ?time - time_slot)
    :precondition (and (at you ?location) (at ?friend ?location) 
                       (can_meet ?friend) (not (scheduled_meeting ?friend)) (current_time ?time))
    :effect (scheduled_meeting ?friend)
  )

  (:action end_meeting
    :parameters (?friend - person ?location - location ?time - time_slot)
    :precondition (and (scheduled_meeting ?friend) (at ?friend ?location) 
                       (at you ?location) (current_time ?time))
    :effect (and (ended_meeting ?friend) 
                 (not (scheduled_meeting ?friend)))
  )
  
  (:action achieve_meeting_goal
    :precondition (ended_meeting barbara)
    :effect (meeting_goal_achieved)
  )
)