(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types attendee timeslot)
  (:predicates
    (available ?a - attendee ?t - timeslot)
    (feasible ?t - timeslot)
    (chosen ?t - timeslot)
    (scheduled)
    (next ?t1 - timeslot ?t2 - timeslot)
    (within-working-hours ?t - timeslot)
  )

  ;; Choose exactly one feasible timeslot that is within working hours
  ;; and for which each required attendee (gerald, roy, barbara) is available.
  ;; Preconditions reference attendee objects by name (declared in the problem).
  (:action choose-slot
    :parameters (?t - timeslot)
    :precondition (and
      (feasible ?t)
      (within-working-hours ?t)
      (not (scheduled))
      (available gerald ?t)
      (available roy ?t)
      (available barbara ?t)
    )
    :effect (and
      (chosen ?t)
      (scheduled)
      (not (feasible ?t))
    )
  )
)