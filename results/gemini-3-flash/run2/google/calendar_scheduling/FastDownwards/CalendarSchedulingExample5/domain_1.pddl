(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants kathryn charlotte lauren - person)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available kathryn ?t)
      (available charlotte ?t)
      (available lauren ?t)
    )
    :effect (meeting_scheduled)
  )
)