(define (domain meeting-scheduler-combined)
  (:requirements :typing)
  (:types time-slot person)
  (:predicates
    (free ?t - time-slot)
    (scheduled ?t - time-slot)
    (within-window ?t - time-slot)
    (blocked ?p - person ?t - time-slot)
    (any-scheduled)
    (slot-available ?t - time-slot)
    (meeting-scheduled)
  )

  (:action margaret-schedule
    :parameters (?t - time-slot)
    :precondition (free ?t)
    :effect (and (not (free ?t))
                 (scheduled ?t))
  )

  (:action donna-schedule
    :parameters (?t - time-slot)
    :precondition (and (within-window ?t)
                       (not (any-scheduled))
                       (not (blocked margaret ?t))
                       (not (blocked donna ?t))
                       (not (blocked helen ?t)))
    :effect (and (scheduled ?t)
                 (any-scheduled))
  )

  (:action third-schedule
    :parameters (?t - time-slot)
    :precondition (and (slot-available ?t)
                       (not (meeting-scheduled)))
    :effect (meeting-scheduled)
  )
)