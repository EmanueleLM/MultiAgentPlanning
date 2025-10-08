(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule
    :parameters (?p1 ?p2 ?p3 ?p4 - participant ?s - slot)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (free ?p4 ?s)
      (not (scheduled ?s))
    )
    :effect (and
      (scheduled ?s)
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
      (not (free ?p4 ?s))
    )
  )
)