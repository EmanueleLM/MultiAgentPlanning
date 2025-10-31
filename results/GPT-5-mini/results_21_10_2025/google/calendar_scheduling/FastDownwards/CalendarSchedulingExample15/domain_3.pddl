(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting-scheduled)
    (scheduled-at ?t - timeslot)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (not (meeting-scheduled))
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )
)