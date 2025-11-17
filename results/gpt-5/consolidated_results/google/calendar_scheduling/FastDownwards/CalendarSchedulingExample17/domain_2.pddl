(define (domain calendar_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:constants
    margaret donna helen - participant
  )
  (:predicates
    (free ?p - participant ?t - timeslot)
    (feasible ?t - timeslot)
    (ready ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-placed)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (feasible ?t)
      (ready ?t)
      (free margaret ?t)
      (free donna ?t)
      (free helen ?t)
      (not (meeting-placed))
    )
    :effect (and
      (scheduled ?t)
      (meeting-placed)
    )
  )
)