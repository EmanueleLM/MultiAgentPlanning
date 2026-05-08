(define (domain calendar_scheduling_example11)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:predicates
    (available ?p - person ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available alexander ?s)
      (available elizabeth ?s)
      (available walter ?s)
    )
    :effect (meeting_scheduled ?s)
  )
)