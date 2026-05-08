(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types participant time_slot)
  (:constants diana ethan janet - participant)
  (:predicates
    (free ?p - participant ?s - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (free diana ?s)
      (free ethan ?s)
      (free janet ?s)
    )
    :effect (meeting_scheduled)
  )
)