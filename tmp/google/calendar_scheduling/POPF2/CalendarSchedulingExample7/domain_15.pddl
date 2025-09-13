(define (domain unified-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time-slot)

  (:predicates
    (available ?p - participant ?t - time-slot)
    (meeting-scheduled ?t - time-slot)
    (participant-attending ?p - participant ?t - time-slot)
  )

  (:action schedule-meeting
    :parameters (?t - time-slot)
    :precondition (and
      (available ?p1 - participant ?t)
      (available ?p2 - participant ?t)
      (available ?p3 - participant ?t)
      (not (meeting-scheduled ?t))
    )
    :effect (and
      (meeting-scheduled ?t)
      (participant-attending ?p1 ?t)
      (participant-attending ?p2 ?t)
      (participant-attending ?p3 ?t)
    )
  )
)