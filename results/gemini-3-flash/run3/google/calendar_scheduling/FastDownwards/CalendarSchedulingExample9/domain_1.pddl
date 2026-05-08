(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants diane kelly deborah - person)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_half_hour_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available diane ?t)
      (available kelly ?t)
      (available deborah ?t)
    )
    :effect (meeting_scheduled)
  )
)