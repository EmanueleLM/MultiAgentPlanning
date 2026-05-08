(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:constants
    emily melissa frank - person
  )
  (:predicates
    (available ?p - person ?t - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (available emily ?t)
      (available melissa ?t)
      (available frank ?t)
    )
    :effect (meeting_scheduled)
  )
)