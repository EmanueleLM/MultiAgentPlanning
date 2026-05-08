(define (domain common-meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    time-point - object
  )
  (:predicates
    (stephen-available ?t - time-point)
    (edward-available ?t - time-point)
    (angela-available ?t - time-point)
    (meeting-scheduled ?t - time-point)
  )
  (:functions (total-cost))

  (:action schedule-meeting
    :parameters (?t - time-point)
    :precondition (and
      (stephen-available ?t)
      (edward-available ?t)
      (angela-available ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (increase (total-cost) 1)
    )
  )
)