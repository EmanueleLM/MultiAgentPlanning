(define (domain vault)
  (:requirements :typing)
  (:types
    agent - object
    key - thing
    vault - thing
    obj - thing
    location - object
    ex - location)
  (:predicates
    (big ?a - agent)
    (small ?a - agent)
    (at ?a - agent ?l - location)
    (has-thing ?a - agent ?t - thing)
    (contains ?v - vault ?t - thing)
    (closed ?v - vault)
    (open ?v - vault)
    (can-enter ?a - agent ?v - vault))
  (:action open-vault
    :parameters (?a - agent ?k - key ?v - vault)
    :precondition (and
                    (at ?a ex)
                    (has-thing ?a ?k)
                    (closed ?v))
    :effect (and
              (not (closed ?v))
              (open ?v)))
  (:action enter-vault
    :parameters (?a - agent ?v - vault)
    :precondition (and
                    (at ?a ex)
                    (open ?v)
                    (can-enter ?a ?v))
    :effect (and
              (at ?a ?v)))
  (:action grab
    :parameters (?a - agent ?v - vault ?t - thing)
    :precondition (and
                    (at ?a ?v)
                    (contains ?v ?t))
    :effect (and
              (not (contains ?v ?t))
              (has-thing ?a ?t))) )