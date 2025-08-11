(define (domain vault-integrated)
  (:requirements :typing :negation)

  (:types
    agent - object
    vault - object
    key   - object
    thing - object
  )

  (:predicates
    (closed ?v - vault)
    (open ?v - vault)
    (small ?a - agent)
    (inside ?a - agent ?v - vault)
    (in ?o - thing ?v - vault)
    (has ?a - agent ?o - thing)
  )

  (:action give-key
    :parameters (?giver - agent ?receiver - agent ?k - key)
    :precondition (and
                    (has ?giver ?k)
                    (not (has ?receiver ?k)))
    :effect (and
             (not (has ?giver ?k))
             (has ?receiver ?k))
  )

  (:action open
    :parameters (?a - agent ?k - key ?v - vault)
    :precondition (and
                    (has ?a ?k)
                    (closed ?v))
    :effect (and
             (open ?v)
             (not (closed ?v)))
  )

  (:action enter
    :parameters (?a - agent ?v - vault)
    :precondition (and
                    (open ?v)
                    (small ?a)
                    (not (inside ?a ?v)))
    :effect (inside ?a ?v)
  )

  (:action grab
    :parameters (?a - agent ?o - thing ?v - vault)
    :precondition (and
                    (inside ?a ?v)
                    (in ?o ?v)
                    (small ?a))
    :effect (and
             (has ?a ?o)
             (not (in ?o ?v)))
  )
)