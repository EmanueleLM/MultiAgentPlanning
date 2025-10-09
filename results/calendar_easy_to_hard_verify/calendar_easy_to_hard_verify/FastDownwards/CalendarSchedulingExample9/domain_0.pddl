(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (scheduled)
    (scheduled-at ?t - time)
  )

  ;; Single parameterized scheduling action: can schedule at a time only if
  ;; all participants are available at that time and meeting not already scheduled.
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