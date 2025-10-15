(define (domain three-colleagues)
  (:requirements :typing :negative-preconditions)
  (:types time person)
  (:predicates
    (available ?p - person ?t - time)
    (slot ?t - time)
    (meeting-scheduled ?t - time)
    (no-meeting)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (available alice ?t)
      (available bob ?t)
      (available carol ?t)
      (no-meeting)
    )
    :effect (and
      (meeting-scheduled ?t)
      (not (no-meeting))
    )
  )
)