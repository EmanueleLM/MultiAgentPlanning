(define (domain collective-scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time_slot)

  (:predicates
    (busy ?p - participant ?t - time_slot)
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )

  (:action mark-available
    :parameters (?p - participant ?t - time_slot)
    :precondition (not (busy ?p ?t))
    :effect (available ?p ?t))

  (:action schedule-meeting
    :parameters (?t - time_slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
                    (available ?p1 ?t)
                    (available ?p2 ?t)
                    (available ?p3 ?t)
                    (not (meeting_scheduled ?t)))
    :effect (meeting_scheduled ?t))
)