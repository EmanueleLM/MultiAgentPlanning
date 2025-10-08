(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:predicates
    (is-slot ?s - slot)
    (free ?a - agent ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot ?d - agent ?j - agent ?e - agent ?p - agent)
    :precondition (and
      (not (scheduled))
      (free ?d ?s)
      (free ?j ?s)
      (free ?e ?s)
      (free ?p ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)