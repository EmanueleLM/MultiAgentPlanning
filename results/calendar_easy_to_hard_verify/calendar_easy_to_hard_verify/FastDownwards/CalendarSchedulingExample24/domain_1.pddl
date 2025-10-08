(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (attends ?a - agent ?s - slot)
  )

  (:action attend
    :parameters (?a - agent ?s - slot)
    :precondition (free ?a ?s)
    :effect (and (attends ?a ?s) (not (free ?a ?s)))
  )
)