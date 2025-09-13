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
    :parameters (?a1 - agent ?a2 - agent ?a3 - agent ?t - time-slot)
    :precondition (and (available ?t) 
                       (not (busy ?a1 ?t))
                       (not (busy ?a2 ?t))
                       (not (busy ?a3 ?t)))
    :effect (scheduled ?t)
  )
)