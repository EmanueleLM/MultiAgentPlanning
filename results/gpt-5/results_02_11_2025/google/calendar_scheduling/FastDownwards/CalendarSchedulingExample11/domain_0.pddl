(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (available-for-all ?s - slot)
    (scheduled)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (available-for-all ?s)
    )
    :effect (and
      (scheduled)
    )
  )
)