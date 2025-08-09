(define (domain vault-cooperative)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent vault key object)
  (:predicates
    (closed ?v - vault)
    (entrance-small ?v - vault)
    (big-robot ?a - agent)
    (has-key ?a - agent ?k - key)
    (in ?a - agent ?v - vault)
    (has-obj ?a - agent ?o - object)
    (object-in-vault ?o - object ?v - vault))
  (:action open-vault
    :parameters (?a - agent ?v - vault ?k - key)
    :precondition (and
      (closed ?v)
      (has-key ?a ?k))
    :effect (not (closed ?v)))
  (:action enter-vault
    :parameters (?a - agent ?v - vault)
    :precondition (and
      (not (in ?a ?v))
      (not (closed ?v))
      (entrance-small ?v)
      (not (big-robot ?a)))
    :effect (in ?a ?v))
  (:action grab-object
    :parameters (?a - agent ?v - vault ?o - object)
    :precondition (and
      (in ?a ?v)
      (object-in-vault ?o ?v))
    :effect (has-obj ?a ?o)))