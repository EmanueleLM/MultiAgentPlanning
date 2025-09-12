(define (domain multi-agent-vault)
  (:requirements :strips :typing)
  (:types agent vault object key entrance)
  (:predicates
    (vault ?v - vault)
    (vault-closed ?v - vault)
    (vault-open ?v - vault)
    (requires-key ?v - vault)
    (entrance ?e - entrance)
    (entrance-small ?e - entrance)
    (entrance-of ?e - entrance ?v - vault)
    (small ?a - agent)
    (big ?a - agent)
    (have ?a - agent ?k - key)
    (object ?o - object)
    (object-in ?o - object ?v - vault)
    (has-object ?a - agent ?o - object)
    (inside ?a - agent ?v - vault)
  )

  (:action open-vault-by-key-holder
    :parameters (?a - agent ?k - key ?v - vault)
    :precondition (and (have ?a ?k) (vault-closed ?v) (requires-key ?v))
    :effect (and (vault-open ?v) (not (vault-closed ?v)))
  )

  (:action enter-vault-by-key-holder
    :parameters (?a - agent ?v - vault)
    :precondition (vault-open ?v)
    :effect (inside ?a ?v)
  )

  (:action grab-object-by-key-holder
    :parameters (?a - agent ?o - object ?v - vault)
    :precondition (and (vault-open ?v) (object-in ?o ?v) (inside ?a ?v))
    :effect (and (has-object ?a ?o) (not (object-in ?o ?v)))
  )

  (:action search-for-key-by-small-robot
    :parameters (?r - agent ?k - key)
    :precondition (small ?r)
    :effect (have ?r ?k)
  )

  (:action open-vault-by-small-robot
    :parameters (?r - agent ?k - key ?v - vault)
    :precondition (and (have ?r ?k) (vault-closed ?v) (requires-key ?v))
    :effect (and (vault-open ?v) (not (vault-closed ?v)))
  )

  (:action enter-vault-by-small-robot
    :parameters (?r - agent ?v - vault ?e - entrance)
    :precondition (and (small ?r) (vault-open ?v) (entrance ?e) (entrance-small ?e) (entrance-of ?e ?v))
    :effect (inside ?r ?v)
  )

  (:action grab-object-by-small-robot
    :parameters (?r - agent ?o - object ?v - vault)
    :precondition (and (inside ?r ?v) (object-in ?o ?v))
    :effect (and (has-object ?r ?o) (not (object-in ?o ?v)))
  )
)