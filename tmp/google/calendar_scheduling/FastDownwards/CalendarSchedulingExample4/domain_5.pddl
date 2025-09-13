(define (domain meeting-scheduling)
  (:requirements :strips :typing)

  (:types
    time-slot agent
  )

  (:predicates
    (available ?t - time-slot)
    (busy ?a - agent ?t - time-slot)
    (scheduled ?t - time-slot)
    (slot ?t - time-slot)
  )

  (:action schedule-meeting
    :parameters (?a - agent ?t - time-slot)
    :precondition (and (available ?t) (not (busy ?a ?t)))
    :effect (scheduled ?t)
  )
)