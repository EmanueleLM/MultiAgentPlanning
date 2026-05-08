(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates
    (available ?p - participant ?t - time_slot)
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