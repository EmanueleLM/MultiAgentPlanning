(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types attendee timeslot)
  (:predicates
    (available ?a - attendee ?t - timeslot)
    (feasible ?t - timeslot)
    (chosen ?t - timeslot)
    (scheduled)
  )

  (:action choose-slot
    :parameters (?t - timeslot ?g - attendee ?r - attendee ?b - attendee)
    :precondition (and
      (feasible ?t)
      (not (scheduled))
      (available ?g ?t)
      (available ?r ?t)
      (available ?b ?t)
    )
    :effect (and
      (chosen ?t)
      (scheduled)
      (not (feasible ?t))
    )
  )
)