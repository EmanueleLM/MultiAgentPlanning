(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types participant time_slot)
  (:predicates
    (available ?p - participant ?s - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available diana ?s)
      (available ethan ?s)
      (available janet ?s)
    )
    :effect (meeting_scheduled)
  )
)