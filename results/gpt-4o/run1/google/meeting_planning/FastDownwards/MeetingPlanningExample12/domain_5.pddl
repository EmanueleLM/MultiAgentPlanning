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
    :parameters (?person - person ?from - location ?to - location ?time_from - time_slot ?time_to - time_slot)
    :precondition (and (at ?person ?from) (not (at ?person ?to)) (current_time ?time_from)
                       (or (and (current_time afternoon) (current_time evening))))
    :effect (and (not (at ?person ?from)) (at ?person ?to) (not (current_time ?time_from)) (current_time ?time_to))
  )

  (:action start_meeting
    :parameters (?person - person ?friend - person ?location - location ?time - time_slot)
    :precondition (and (at ?person ?location) (at ?friend ?location) 
                       (can_meet ?friend) (not (scheduled_meeting ?friend)) (current_time ?time) (current_time evening))
    :effect (and (scheduled_meeting ?friend) (started_meeting ?friend))
  )

  (:action end_meeting
    :parameters (?person - person ?friend - person ?location - location ?time - time_slot)
    :precondition (and (scheduled_meeting ?friend) (at ?friend ?location) 
                       (at ?person ?location) (current_time ?time) (current_time evening))
    :effect (and (ended_meeting ?friend) (not (scheduled_meeting ?friend)))
  )
  
  (:action achieve_meeting_goal
    :parameters (?person - person ?friend - person)
    :precondition (ended_meeting ?friend)
    :effect (meeting_goal_achieved)
  )
)