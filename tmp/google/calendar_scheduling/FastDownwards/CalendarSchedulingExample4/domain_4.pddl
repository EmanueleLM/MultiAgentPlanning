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

  (:action schedule-meeting-donna
    :parameters (?t - time-slot)
    :precondition (and (available ?t) (not (busy donna ?t)))
    :effect (scheduled ?t)
  )

  (:action schedule-meeting-john
    :parameters (?t - time-slot)
    :precondition (and (available ?t) (not (busy john ?t)))
    :effect (scheduled ?t)
  )

  (:action schedule-meeting-billy
    :parameters (?t - time-slot)
    :precondition (and (available ?t) (not (busy billy ?t)))
    :effect (scheduled ?t)
  )
)