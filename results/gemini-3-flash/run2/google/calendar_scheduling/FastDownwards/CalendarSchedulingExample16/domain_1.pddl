(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available scott ?t)
      (available gabriel ?t)
      (available christine ?t)
    )
    :effect (meeting_scheduled)
  )
)