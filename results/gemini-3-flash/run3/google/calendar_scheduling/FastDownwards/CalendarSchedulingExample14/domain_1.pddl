(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants brandon jerry bradley - person)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
    )
    :effect (meeting_scheduled)
  )
)