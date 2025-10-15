(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
    (allowed ?t - time)
  )

  ;; Schedule action: can schedule the single 30-minute meeting at a time slot ?t
  ;; Precondition: the time is allowed and every participant is free at that time.
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (allowed ?t)
      (free nicholas ?t)
      (free emma ?t)
      (free catherine ?t)
      (free steven ?t)
      (free adam ?t)
      (free lori ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )
)