(define (domain calendar_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants
    margaret donna helen - participant
  )
  (:predicates
    (free ?p - participant ?t - timeslot)
    (feasible ?t - timeslot)
    (scheduled ?t - timeslot)
  )

  (:action schedule_at
    :parameters (?t - timeslot)
    :precondition (and
      (feasible ?t)
      (free margaret ?t)
      (free donna ?t)
      (free helen ?t)
      (not (scheduled ?t))
    )
    :effect (scheduled ?t)
  )
)