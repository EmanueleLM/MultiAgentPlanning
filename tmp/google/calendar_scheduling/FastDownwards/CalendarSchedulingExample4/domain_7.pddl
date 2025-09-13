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
    :parameters (?t - time-slot)
    :precondition (and (available ?t) 
                       (not (busy donna ?t))
                       (not (busy john ?t))
                       (not (busy billy ?t)))
    :effect (scheduled ?t)
  )
)