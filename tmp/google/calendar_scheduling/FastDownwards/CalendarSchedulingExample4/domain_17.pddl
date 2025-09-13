(define (domain multi-agent-meeting-scheduling)
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

  (:action check-availability-donna
    :parameters (?t - time-slot)
    :precondition (and (not (busy donna ?t)))
    :effect (available ?t)
  )

  (:action check-availability-john
    :parameters (?t - time-slot)
    :precondition (and (not (busy john ?t)))
    :effect (available ?t)
  )

  (:action check-availability-billy
    :parameters (?t - time-slot)
    :precondition (and (not (busy billy ?t)))
    :effect (available ?t)
  )

  (:action schedule-meeting
    :parameters (?t - time-slot)
    :precondition (and (available ?t))
    :effect (scheduled ?t)
  )
)