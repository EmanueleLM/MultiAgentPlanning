(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    lisa bobby randy - person
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free lisa ?t)
      (free bobby ?t)
      (free randy ?t)
    )
    :effect (meeting_scheduled)
  )
)