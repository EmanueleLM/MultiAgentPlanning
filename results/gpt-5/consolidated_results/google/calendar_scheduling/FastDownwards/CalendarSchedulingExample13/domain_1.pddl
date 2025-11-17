(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types attendee timeslot)
  (:predicates
    (feasible ?t - timeslot)
    (chosen ?t - timeslot)
    (scheduled)
  )
  (:action choose-slot
    :parameters (?t - timeslot)
    :precondition (and
      (feasible ?t)
      (not (scheduled))
      (not (chosen ?t))
    )
    :effect (and
      (chosen ?t)
      (scheduled)
    )
  )
)