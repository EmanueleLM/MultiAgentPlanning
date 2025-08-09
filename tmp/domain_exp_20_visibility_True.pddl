(define (domain vault-integrated)
  (:requirements :typing :strips)
  (:types
    agent
    vault
    thing
    location)
  (:predicates
    (big ?a - agent)
    (small ?a - agent)
    (at ?a - agent ?l - location)
    (has-key ?a - agent ?k - thing)
    (vault-closed)
    (vault-open)
    (can-enter ?a - agent vault)
    (object-grabbed-by ?a - agent))
  (:action fetch-key
    :parameters (?from - agent ?to - agent ?k - thing)
    :precondition (and
                    (at ?from outside)
                    (at ?to outside)
                    (has-key ?from ?k))
    :effect (and
              (not (has-key ?from ?k))
              (has-key ?to ?k)))
  (:action open-vault
    :parameters (?a - agent ?k - thing)
    :precondition (and
                    (big ?a)
                    (at ?a outside)
                    (has-key ?a ?k)
                    (vault-closed))
    :effect (and
              (not (vault-closed))
              (vault-open)))
  (:action enter-vault
    :parameters (?a - agent)
    :precondition (and
                    (at ?a outside)
                    (vault-open)
                    (can-enter ?a vault))
    :effect (at ?a vault))
  (:action grab-object
    :parameters (?a - agent)
    :precondition (and
                    (at ?a vault)
                    (not (object-grabbed-by ?a)))
    :effect (object-grabbed-by ?a)))