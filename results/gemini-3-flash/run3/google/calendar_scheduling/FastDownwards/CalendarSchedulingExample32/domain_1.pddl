(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    emily melissa frank - person
  )
  (:predicates
    (free ?p - person ?s - slot)
    (frank_allowed ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free emily ?s)
      (free melissa ?s)
      (free frank ?s)
      (frank_allowed ?s)
    )
    :effect (meeting_scheduled)
  )
)