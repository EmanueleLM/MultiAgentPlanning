(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (is_preferred ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (free isabella ?s)
      (free ronald ?s)
      (free amanda ?s)
      (is_preferred ?s)
    )
    :effect (meeting_scheduled)
  )
)