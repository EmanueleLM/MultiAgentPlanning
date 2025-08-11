(define (domain vault-domain)
  (:requirements
    :strips
    :typing
    :negative-preconditions
  )
  (:types agent)
  (:predicates
    (has-key ?ag - agent)
    (vault-closed)
    (vault-open)
    (can-enter ?ag - agent)
    (inside ?ag - agent)
    (has-object ?ag - agent)
  )
  (:action get-key
    :parameters (?from - agent ?to - agent)
    :precondition (has-key ?from)
    :effect (and
              (not (has-key ?from))
              (has-key ?to))
  )
  (:action open-vault
    :parameters (?ag - agent)
    :precondition (and
                    (has-key ?ag)
                    (vault-closed))
    :effect (and
              (not (vault-closed))
              (vault-open))
  )
  (:action enter-vault
    :parameters (?ag - agent)
    :precondition (and
                    (can-enter ?ag)
                    (vault-open))
    :effect (inside ?ag)
  )
  (:action grab-object
    :parameters (?ag - agent)
    :precondition (inside ?ag)
    :effect (has-object ?ag)
  )
)