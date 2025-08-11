(define (domain vault-integration)
  (:requirements :typing :strips :equality)
  (:types agent thing location)
  (:predicates
    (has-key ?ag - agent)
    (has-object ?ag - agent)
    (open ?v - thing)
    (object-in ?v - thing)
    (size-big ?ag - agent)
    (size-small ?ag - agent)
    (at ?ag - agent ?loc - location)
  )
  (:action give-key
    :parameters (?giver - agent ?receiver - agent)
    :precondition (and
                    (has-key ?giver)
                    (not (has-key ?receiver)))
    :effect (and
              (has-key ?receiver)
              (not (has-key ?giver))) )
  (:action open-vault
    :parameters (?ag - agent ?vault - thing)
    :precondition (and
                    (has-key ?ag)
                    (not (open ?vault)))
    :effect (open ?vault) )
  (:action enter-vault
    :parameters (?ag - agent ?vault - thing ?loc - location)
    :precondition (and
                    (= ?ag agentB)
                    (open ?vault)
                    (at ?ag ?loc))
    :effect (at ?ag ?vault) )
  (:action grab-object
    :parameters (?ag - agent ?vault - thing ?loc - location)
    :precondition (and
                    (= ?ag agentB)
                    (at ?ag ?vault)
                    (object-in ?vault)
                    (size-small ?ag))
    :effect (and
              (has-object ?ag)
              (not (object-in ?vault))) )
)