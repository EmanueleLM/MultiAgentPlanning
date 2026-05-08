(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    diana ethan janet - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (scheduled)
    (meeting_at ?t - timeslot)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available diana ?t)
      (available ethan ?t)
      (available janet ?t)
    )
    :effect (and
      (scheduled)
      (meeting_at ?t)
    )
  )
)