(define (domain combined-vault)
  (:requirements :typing :strips :empty-preconditions)
  (:types agent location key object)

  (:predicates
    (at ?a - agent ?l - location)
    (has-key ?a - agent)
    (has-object ?a - object)
    (vault-closed)
    (open-vault)
    (small ?a - agent)
    (object-in-vault ?o - object)
  )

  (:action transfer-key
    :parameters (?from - agent ?to - agent)
    :precondition (has-key ?from)
    :effect (and (not (has-key ?from))
                 (has-key ?to))
  )

  (:action open-vault
    :parameters (?a - agent)
    :precondition (and (has-key ?a) (vault-closed))
    :effect (and (open-vault)
                 (not (vault-closed)))
  )

  (:action enter-vault
    :parameters (?a - agent)
    :precondition (and (open-vault) (at ?a outside) (small ?a))
    :effect (and (not (at ?a outside))
                 (at ?a vault))
  )

  (:action grab-object
    :parameters (?a - agent ?o - object)
    :precondition (and (at ?a vault)
                       (object-in-vault ?o)
                       (open-vault))
    :effect (and (has-object ?o)
                 (not (object-in-vault ?o)))
  )
)