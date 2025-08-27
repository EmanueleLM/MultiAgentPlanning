(define (domain multi-agent-vault-operation)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    robot object key vault)

  (:predicates
    (has-key ?r - robot ?k - key)
    (vault-closed ?v - vault)
    (vault-open ?v - vault)
    (vault-has-object ?v - vault ?o - object)
    (object-grasped ?r - robot ?o - object)
    (can-access-vault ?r - robot ?v - vault))

  (:action open-vault
    :parameters (?r - robot ?v - vault ?k - key)
    :precondition (and (has-key ?r ?k) (vault-closed ?v) (can-access-vault ?r ?v))
    :effect (and (not (vault-closed ?v)) (vault-open ?v)))

  (:action grab-object
    :parameters (?r - robot ?v - vault ?o - object)
    :precondition (and (vault-open ?v) (vault-has-object ?v ?o) (can-access-vault ?r ?v))
    :effect (object-grasped ?r ?o)))