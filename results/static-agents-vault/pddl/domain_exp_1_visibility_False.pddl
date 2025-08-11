(define (domain vault-domain)
  (:requirements :strips :typing)

  (:types agent vault key object)

  (:predicates
    (closed ?v - vault)
    (has-key ?a - agent ?k - key)
    (has ?a - agent ?o - object)
    (big ?a - agent)
    (small ?a - agent)
  )

  (:action open-vault
    :parameters (?a - agent ?v - vault ?k - key)
    :precondition (and
                    (closed ?v)
                    (has-key ?a ?k))
    :effect (not (closed ?v)))
  (:action grab-object
    :parameters (?a - agent ?v - vault ?o - object)
    :precondition (and
                    (not (closed ?v))
                    (small ?a)
                    (not (has ?a ?o)))
    :effect (has ?a ?o))
)