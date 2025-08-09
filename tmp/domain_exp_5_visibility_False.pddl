(define (domain vault-collect)
  (:requirements :strips :typing)
  (:types robot vault key object)
  (:predicates
    (vault-closed ?v - vault)
    (vault-open ?v - vault)
    (has-key ?r - robot ?k - key)
    (object-inside-vault ?o - object ?v - vault)
    (big ?r - robot)
    (small ?r - robot)
    (inside ?r - robot ?v - vault)
    (has-object ?r - robot ?o - object))
  (:action open-vault
    :parameters (?r - robot ?v - vault ?k - key)
    :precondition (and
      (vault-closed ?v)
      (has-key ?r ?k))
    :effect (and
      (not (vault-closed ?v))
      (vault-open ?v)))
  (:action enter-vault
    :parameters (?r - robot ?v - vault)
    :precondition (and
      (vault-open ?v)
      (small ?r))
    :effect (inside ?r ?v))
  (:action grab-object
    :parameters (?r - robot ?v - vault ?o - object)
    :precondition (and
      (inside ?r ?v)
      (object-inside-vault ?o ?v)
      (not (big ?r)))
    :effect (and
      (has-object ?r ?o)
      (not (object-inside-vault ?o ?v))) ))
