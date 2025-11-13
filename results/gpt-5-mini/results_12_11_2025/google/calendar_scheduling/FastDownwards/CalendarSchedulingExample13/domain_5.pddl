(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types attendee timeslot)
  (:predicates
    (available ?a - attendee ?t - timeslot)
    (feasible ?t - timeslot)
    (chosen ?t - timeslot)
    (scheduled)
  )

  ;; Choose exactly one feasible timeslot for all named attendees.
  (:action choose-slot
    :parameters (?t - timeslot)
    :precondition (and
      (feasible ?t)
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