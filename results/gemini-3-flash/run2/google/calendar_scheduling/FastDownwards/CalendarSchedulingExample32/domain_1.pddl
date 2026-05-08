(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    emily melissa frank - person
  )
  (:predicates
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (available emily ?s)
      (available melissa ?s)
      (available frank ?s)
    )
    :effect (meeting_scheduled)
  )
)