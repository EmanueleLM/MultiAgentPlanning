(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (meeting_scheduled)
    (available ?p - participant ?ts - timeslot)
    (busy ?p - participant ?ts - timeslot)
  )
  (:action schedule_meeting
    :parameters (?p1 ?p2 ?p3 - participant ?ts - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (available ?p1 ?ts)
      (available ?p2 ?ts)
      (available ?p3 ?ts)
    )
    :effect (meeting_scheduled)
  )
)