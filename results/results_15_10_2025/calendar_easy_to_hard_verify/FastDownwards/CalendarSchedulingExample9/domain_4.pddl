(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person time)
  (:constants diane kelly deborah - person)
  (:predicates
    (available ?p - person ?t - time)
    (scheduled)
    (scheduled-at ?t - time)
  )
  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (available diane ?t)
      (available kelly ?t)
      (available deborah ?t)
    )
    :effect (and
      (scheduled)
      (scheduled-at ?t)
    )
  )
)