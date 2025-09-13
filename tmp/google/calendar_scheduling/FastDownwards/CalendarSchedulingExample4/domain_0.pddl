```lisp
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

  ;; Action from Agent 1: to schedule if available
  (:action schedule-meeting-agent1
    :parameters (?t - time-slot)
    :precondition (available ?t)
    :effect (scheduled ?t)
  )

  ;; Action from Agent 2: to schedule if available and not busy
  (:action schedule-meeting-agent2
    :parameters (?t - time-slot)
    :precondition (and (available ?t) (not (busy ?t)))
    :effect (scheduled ?t)
  )

  ;; Action from Agent 3: find available slot based on specific free times
  (:action find-available-slot-agent3
    :parameters (?t - time-slot)
    :precondition (and (slot ?t) (available ?t))
    :effect (scheduled ?t)
  )
)
```