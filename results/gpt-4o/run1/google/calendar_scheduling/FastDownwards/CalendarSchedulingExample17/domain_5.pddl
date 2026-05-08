(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates
    (available ?p - person ?t - time_slot)
    (scheduled ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (available margaret ?t)
      (available donna ?t)
      (available helen ?t)
      (not (scheduled ?t))
    )
    :effect (scheduled ?t)
  )
)