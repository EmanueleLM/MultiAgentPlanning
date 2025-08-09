(define (domain vault-domain)
  (:requirements :strips :typing)
  (:types agent location object)
  (:predicates
    (at ?a - agent ?l - location)
    (vault-closed)
    (vault-open)
    (entrance-small)
    (has-key ?a - agent)
    (has ?a - agent ?o - object)
    (object-here ?o - object))
  (:action take-key
    :parameters (?giver - agent ?rec - agent)
    :precondition (and (has-key ?giver) (at ?giver outside) (at ?rec outside))
    :effect (and (has-key ?rec) (not (has-key ?giver))))
  (:action open-vault
    :parameters (?a - agent)
    :precondition (and (has-key ?a) (vault-closed))
    :effect (and (not (vault-closed)) (vault-open)))
  (:action enter-vault
    :parameters (?a - agent)
    :precondition (and (at ?a outside) (entrance-small) (vault-open))
    :effect (and (not (at ?a outside)) (at ?a vault)))
  (:action grab-object
    :parameters (?a - agent ?o - object)
    :precondition (and (at ?a vault) (vault-open) (object-here ?o))
    :effect (and (has ?a ?o) (not (object-here ?o))))
)