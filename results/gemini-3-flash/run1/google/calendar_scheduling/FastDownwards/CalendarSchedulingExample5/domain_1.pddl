(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
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
    :effect (and
      (meeting_scheduled)
    )
  )
)