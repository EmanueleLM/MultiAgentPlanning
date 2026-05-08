(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (available isabella ?t)
      (available ronald ?t)
      (available amanda ?t)
    )
    :effect (meeting_scheduled)
  )
)