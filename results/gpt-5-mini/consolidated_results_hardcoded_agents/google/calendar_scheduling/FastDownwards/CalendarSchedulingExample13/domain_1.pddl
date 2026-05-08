(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types attendee timeslot)
  (:predicates
    (feasible ?t - timeslot)
    (chosen ?t - timeslot)
    (scheduled)
    (attendee ?a - attendee)
    (available ?a - attendee ?t - timeslot)
  )

  ;; choose-slot picks exactly one feasible timeslot (enforced by scheduled flag)
  (:action choose-slot
    :parameters (?t - timeslot)
    :precondition (and
      (feasible ?t)
      (not (scheduled))
    )
    :effect (and
      (chosen ?t)
      (scheduled)
      (not (feasible ?t))
    )
  )
)