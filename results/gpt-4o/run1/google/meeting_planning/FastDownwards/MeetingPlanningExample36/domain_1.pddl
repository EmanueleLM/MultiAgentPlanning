(define (domain san_francisco_meeting)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at ?loc - location)
    (time_reached ?time - time)
    (can_meet ?person - person ?loc - location)
    (meeting_scheduled ?person - person)
  )
  
  (:action move
    :parameters (?from - location ?to - location)
    :precondition (at ?from)
    :effect (and (not (at ?from)) (at ?to))
  )
  
  (:action wait_until
    :parameters (?time - time)
    :precondition (time_reached ?time)
    :effect (time_reached ?time)
  )
  
  (:action meet
    :parameters (?person - person ?loc - location)
    :precondition (and (at ?loc) (can_meet ?person ?loc))
    :effect (meeting_scheduled ?person)
  )
)