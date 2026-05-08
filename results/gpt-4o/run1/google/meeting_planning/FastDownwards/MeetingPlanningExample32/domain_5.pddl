(define (domain san_francisco_meeting)

  (:requirements :strips :typing :negative-preconditions)

  (:types location person)

  (:predicates
    (at ?p - person ?l - location)
    (meeting_in_progress ?p - person)
    (visited ?l - location)
  )

  (:action travel
    :parameters (?traveler - person ?from - location ?to - location)
    :precondition (and (at ?traveler ?from) (not (at ?traveler ?to)))
    :effect (and (not (at ?traveler ?from)) (at ?traveler ?to) (visited ?to))
  )

  (:action start_meeting
    :parameters (?p - person)
    :precondition (and (at traveler golden_gate_park) (at ?p golden_gate_park) (not (meeting_in_progress ?p)))
    :effect (meeting_in_progress ?p)
  )

  (:action end_meeting
    :parameters (?p - person)
    :precondition (meeting_in_progress ?p)
    :effect (not (meeting_in_progress ?p))
  )
  
)