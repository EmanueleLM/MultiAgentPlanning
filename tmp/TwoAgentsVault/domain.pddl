(define (domain multi-agent-vault)
  (:requirements :strips :typing)
  (:types robot)

  (:predicates
     (vault-closed)
     (vault-open)
     (object-retrieved)
     (have-key ?r - robot)
     (big-robot ?r - robot)
     (small-robot ?r - robot)
     (vault-restricted-access)
     (at-small ?r - robot)
     (object-inside)
  )

  (:action use-key-big
    :parameters (?r - robot)
    :precondition (and (have-key ?r) (vault-closed) (big-robot ?r))
    :effect (and (vault-open) (not (vault-closed)))
  )

  (:action analyze-access
    :parameters (?r - robot)
    :precondition (big-robot ?r)
    :effect (vault-restricted-access)
  )

  (:action use-key-small
    :parameters (?r - robot)
    :precondition (and (vault-closed) (have-key ?r) (small-robot ?r) (vault-restricted-access) (at-small ?r))
    :effect (and (not (vault-closed)) (vault-open))
  )

  (:action grab-object-small
    :parameters (?r - robot)
    :precondition (and (vault-open) (object-inside) (small-robot ?r) (at-small ?r))
    :effect (and (object-retrieved) (not (object-inside)))
  )

  (:action pass-key
    :parameters (?giver - robot ?receiver - robot)
    :precondition (and (have-key ?giver) (big-robot ?giver) (small-robot ?receiver))
    :effect (and (not (have-key ?giver)) (have-key ?receiver))
  )
)