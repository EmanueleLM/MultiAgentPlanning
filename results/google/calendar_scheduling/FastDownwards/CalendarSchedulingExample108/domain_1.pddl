(define (domain calendar-scheduling)
  (:requirements :strips)
  (:predicates (available ?p ?s) (scheduled ?s))
  (:action schedule
    :parameters (?s)
    :precondition (and (available lisa ?s) (available dorothy ?s) (available anthony ?s) (available ryan ?s))
    :effect (and (scheduled ?s))
  )
)