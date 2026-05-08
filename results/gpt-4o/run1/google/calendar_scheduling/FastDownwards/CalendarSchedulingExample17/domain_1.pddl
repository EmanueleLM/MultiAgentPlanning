(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )

  (:action Schedule_Meeting
    :parameters (?t - time_slot)
    :precondition (and
      (available margaret ?t)
      (available donna ?t)
      (available helen ?t)
      (not (meeting_scheduled ?t))
    )
    :effect (meeting_scheduled ?t)
  )
)