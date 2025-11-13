(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (candidate ?t - timeslot)
    (scheduled ?t - timeslot)
    (all-free ?t - timeslot)
    (meeting-scheduled)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (candidate ?t)
      (all-free ?t)
      (not (scheduled ?t))
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)