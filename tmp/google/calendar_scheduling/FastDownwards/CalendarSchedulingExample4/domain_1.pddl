(define (domain meeting-scheduling)
  (:requirements :strips :typing)

  (:types
    time-slot
  )

  (:predicates
    (available ?t - time-slot)
    (busy ?t - time-slot)
    (scheduled ?t - time-slot)
    (slot ?t - time-slot)
  )

  (:action schedule-meeting-agent1
    :parameters (?t - time-slot)
    :precondition (available ?t)
    :effect (scheduled ?t)
  )

  (:action schedule-meeting-agent2
    :parameters (?t - time-slot)
    :precondition (and (available ?t) (not (busy ?t)))
    :effect (scheduled ?t)
  )

  (:action find-available-slot-agent3
    :parameters (?t - time-slot)
    :precondition (and (slot ?t) (available ?t))
    :effect (scheduled ?t)
  )
)