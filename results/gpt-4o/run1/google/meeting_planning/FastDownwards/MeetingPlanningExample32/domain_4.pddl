(define (domain san_francisco_meeting)

  (:requirements :strips :typing :negative-preconditions)

  (:types location person)

  (:predicates
    (at ?p - person ?l - location)
    (visited ?l - location)
    (meeting_in_progress)
    (meeting_completed)
  )

  (:action travel
    :parameters (?traveler - person ?from - location ?to - location)
    :precondition (and (at ?traveler ?from) (not (at ?traveler ?to)))
    :effect (and (not (at ?traveler ?from)) (at ?traveler ?to) (visited ?to))
  )

  (:action start_meeting
    :parameters ()
    :precondition (and (at traveler golden_gate_park) (at jeffrey golden_gate_park) (not (meeting_in_progress)))
    :effect (meeting_in_progress)
  )

  (:action continue_meeting
    :parameters ()
    :precondition (and (meeting_in_progress))
    :effect (meeting_completed)
  )

  (:action end_meeting
    :parameters ()
    :precondition (and (meeting_in_progress) (meeting_completed))
    :effect (and (not (meeting_in_progress)))
  )
)