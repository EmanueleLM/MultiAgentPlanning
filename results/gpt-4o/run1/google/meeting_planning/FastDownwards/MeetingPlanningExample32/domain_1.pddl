(define (domain san_francisco_meeting)

  (:requirements :strips :typing :negative-preconditions)

  (:types location person)

  (:predicates
    (at ?p - person ?l - location)
    (visited ?l - location)
    (meeting_started)
    (meeting_completed)
  )

  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and (at you ?from) (not (at you ?to)))
    :effect (and (not (at you ?from)) (at you ?to) (visited ?to))
  )

  (:action start_meeting
    :parameters ()
    :precondition (and (at you golden_gate_park) (at jeffrey golden_gate_park) (not (meeting_started)))
    :effect (meeting_started)
  )

  (:action end_meeting
    :parameters ()
    :precondition (and (meeting_started) (not (meeting_completed)))
    :effect (meeting_completed)
  )
)