(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants brandon jerry bradley - person)
  (:predicates
    (free ?p - person ?s - timeslot)
    (meeting_at ?s - timeslot)
    (any_meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting_at ?s)
      (any_meeting_scheduled)
    )
  )
)