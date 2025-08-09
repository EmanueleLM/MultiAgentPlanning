(define (domain vault-multiagent-domain)
  (:requirements :strips :typing)
  (:types
    agent
    thing
    key
    vault
    object
    location
  )
  (:constants
    bigRobot - agent
    smallRobot - agent
    vault - vault
    key - key
    item - object
    outside - location
  )
  (:predicates
    (big ?a - agent)
    (small ?a - agent)
    (at ?a - agent ?l - location)
    (atobj ?o - object ?l - location)
    (closed ?v - vault)
    (open ?v - vault)
    (has-key ?a - agent ?k - key)
    (has-obj ?a - agent ?o - object)
    (entrance-small ?v - vault)
  )
  (action open-vault
    :parameters (?a - agent ?v - vault ?k - key)
    :precondition (and
                    (big ?a)
                    (at ?a ?v)
                    (has-key ?a ?k)
                    (closed ?v))
    :effect (and
              (open ?v)
              (not (closed ?v)))
  )
  (action move-inside
    :parameters (?a - agent ?v - vault)
    :precondition (and
                    (small ?a)
                    (at ?a outside)
                    (open ?v)
                    (entrance-small ?v))
    :effect (and
              (not (at ?a outside))
              (at ?a vault))
  )
  (action grab-object
    :parameters (?a - agent ?o - object ?v - vault)
    :precondition (and
                    (small ?a)
                    (at ?a vault)
                    (open ?v)
                    (atobj ?o vault)
                    (not (has-obj ?a ?o)))
    :effect (and
              (has-obj ?a ?o)
              (not (atobj ?o vault)))
  )
)