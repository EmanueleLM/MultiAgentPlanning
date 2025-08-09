(define (domain vault-coop-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types robot key object vault - location)
  (:predicates
    (at ?r - robot ?l - location)
    (small ?r - robot)
    (big ?r - robot)
    (has-key ?r - robot)
    (vault-closed)
    (vault-open)
    (has-object ?r - robot)
    (at ?o - object ?l - location)
  )
  (:action open-vault
    :parameters (?r - robot ?v - vault ?l - location)
    :precondition (and
      (has-key ?r)
      (vault-closed)
      (at ?r ?l))
    :effect (and
      (not (vault-closed))
      (vault-open)))
  (:action enter-vault
    :parameters (?r - robot ?v - vault ?l - location)
    :precondition (and
      (vault-open)
      (small ?r)
      (at ?r ?l))
    :effect (and
      (not (at ?r ?l))
      (at ?r ?v)))
  (:action grab-object
    :parameters (?r - robot ?o - object ?v - vault)
    :precondition (and
      (at ?r ?v)
      (vault-open)
      (at ?o ?v))
    :effect (and
      (has-object ?r)
      (not (at ?o ?v))) ))