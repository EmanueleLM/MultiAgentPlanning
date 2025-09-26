(define (domain meeting-scheduling)
  (:requirements :typing :adl)
  (:types participant slot meeting)
  (:predicates
    (free ?p - participant ?s - slot)
    (assigned ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p ?s))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m ?s)
      (forall (?p - participant) (not (free ?p ?s)))
    )
  )
)