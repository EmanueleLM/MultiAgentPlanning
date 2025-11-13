(define (domain schedule-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (within_work_hours ?t - timeslot)
    (scheduled ?t - timeslot)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (within_work_hours ?t)
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
      (not (scheduled ?t))
    )
    :effect (and
      (scheduled ?t)
      (not (available ?p1 ?t))
      (not (available ?p2 ?t))
      (not (available ?p3 ?t))
    )
  )
)