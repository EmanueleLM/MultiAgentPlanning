(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting-scheduled)
    (scheduled-at ?t - timeslot)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (available joyce ?t)
      (available christine ?t)
      (available alexander ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )
)