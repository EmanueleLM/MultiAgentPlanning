(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants
    ralph peter daniel - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available ralph ?t)
      (available peter ?t)
      (available daniel ?t)
    )
    :effect (meeting_scheduled)
  )
)