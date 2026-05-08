(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free ?p - participant ?t - timeslot)
    (before_noon ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule-meeting
    :parameters (?t - timeslot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (before_noon ?t)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
    )
    :effect (and
      (meeting_scheduled)
      (not (free ?p1 ?t))
      (not (free ?p2 ?t))
      (not (free ?p3 ?t))
    )
  )
)