(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?s - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (meeting_scheduled)
  )
)