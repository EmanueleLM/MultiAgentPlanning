(define (domain calendar_domain)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    bradley zachary teresa - person
  )
  (:predicates
    (free ?p - person ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_half_hour_meeting
    :parameters (?s - slot)
    :precondition (and
      (free bradley ?s)
      (free zachary ?s)
      (free teresa ?s)
    )
    :effect (meeting_scheduled)
  )
)