(define (domain vault-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types agent object location)
  (:constants agentA agentB - agent vault-obj - object outside vault - location)
  (:predicates
    (at ?ag - agent ?loc - location)
    (has-key ?ag - agent)
    (has-object ?ag - agent)
    (vault-open))

  (:action open-vault
    :parameters (?a - agent)
    :precondition (and
      (at ?a outside)
      (has-key ?a)
      (not (vault-open)))
    :effect (not (not (vault-open))) )

  (:action enter-vault
    :parameters (?a - agent)
    :precondition (and
      (at ?a outside)
      (vault-open))
    :effect (and
      (at ?a vault)
      (not (at ?a outside))) )

  (:action grab-object
    :parameters (?a - agent)
    :precondition (and
      (at ?a vault)
      (not (has-object ?a)))
    :effect (has-object ?a)) )