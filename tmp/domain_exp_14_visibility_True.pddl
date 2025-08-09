(define (domain vault-domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types agent)

  (:predicates
    (vault-closed)
    (vault-opened)
    (has-key ?a - agent)
    (big ?a - agent)
    (in-vault ?a - agent)
    (object-available)
    (has-object ?a - agent)
  )

  (:action open-vault
    :parameters (?a - agent)
    :precondition (and (has-key ?a) (vault-closed))
    :effect (and (not (vault-closed)) (vault-opened))
  )

  (:action enter-vault
    :parameters (?a - agent)
    :precondition (and (vault-opened) (not (big ?a)) (not (in-vault ?a)))
    :effect (in-vault ?a)
  )

  (:action grab-object
    :parameters (?a - agent)
    :precondition (and (in-vault ?a) (object-available))
    :effect (and (has-object ?a) (not (object-available)))
  )
)