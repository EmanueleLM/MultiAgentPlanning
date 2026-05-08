(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?x - obj ?y - obj)
  )

  ;; Single, generic agent-prefixed action to establish a craving relationship.
  ;; The precondition forbids re-establishing an existing craving (no bookkeeping shortcuts).
  (:action agent-set-crave
    :parameters (?from - obj ?to - obj)
    :precondition (not (craves ?from ?to))
    :effect (craves ?from ?to)
  )
)