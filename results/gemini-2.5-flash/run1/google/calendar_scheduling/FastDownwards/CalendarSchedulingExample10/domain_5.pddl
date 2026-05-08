(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person
    time_slot
  )
  (:constants
    diana ethan janet - person
  )
  (:predicates
    (available ?p - person ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available diana ?s)
      (available ethan ?s)
      (available janet ?s)
    )
    :effect (meeting_scheduled ?s)
  )
)