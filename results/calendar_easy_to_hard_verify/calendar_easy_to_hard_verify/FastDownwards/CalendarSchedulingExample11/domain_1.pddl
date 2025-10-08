(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (free madison ?s)
      (free linda ?s)
      (free logan ?s)
      (free virginia ?s)
      (not (scheduled ?s))
    )
    :effect (and
      (scheduled ?s)
      (not (free madison ?s))
      (not (free linda ?s))
      (not (free logan ?s))
      (not (free virginia ?s))
    )
  )
)