(define (domain schedule-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (within_work_hours ?t - timeslot)
    (scheduled ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (within_work_hours ?t)
      (available scott ?t)
      (available gabriel ?t)
      (available christine ?t)
      (not (scheduled ?t))
    )
    :effect (and
      (scheduled ?t)
      (not (available scott ?t))
      (not (available gabriel ?t))
      (not (available christine ?t))
    )
  )
)