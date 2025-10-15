(define (domain multiagent-items)
  (:requirements :strips :typing)
  (:types agent item location)

  (:predicates
    (at ?a - agent ?l - location)
    (at-item ?i - item ?l - location)
    (has ?a - agent ?i - item)
    (used ?i - item)
    (attached ?i - item ?j - item)
    (unhappy ?a - agent)
    (knows ?a - agent ?i - item)
    (willing ?a - agent)
    (tight ?a - agent ?i - item)
  )

  ;; paltry: agent ?a picks up item ?i from location ?l if agent is present,
  ;; the item is at that location, and the agent is willing.
  (:action paltry
    :parameters (?a - agent ?i - item ?l - location)
    :precondition (and (at ?a ?l) (at-item ?i ?l) (willing ?a))
    :effect (and (has ?a ?i)
                 (not (at-item ?i ?l)))
  )

  ;; sip: agent ?a uses/consumes item ?i that they have.
  (:action sip
    :parameters (?a - agent ?i - item)
    :precondition (and (has ?a ?i))
    :effect (and (used ?i)
                 (not (has ?a ?i)))
  )

  ;; clip: agent ?a attaches item ?j to item ?i; requires both items held by the same agent.
  ;; After attaching, item ?j is no longer held (it becomes attached to ?i).
  (:action clip
    :parameters (?a - agent ?i - item ?j - item)
    :precondition (and (has ?a ?i) (has ?a ?j))
    :effect (and (attached ?i ?j)
                 (not (has ?a ?j)))
  )

  ;; wretched: agent ?a gives item ?i to agent ?b; recipient becomes unhappy as a side effect.
  (:action wretched
    :parameters (?a - agent ?b - agent ?i - item)
    :precondition (and (has ?a ?i))
    :effect (and (has ?b ?i)
                 (not (has ?a ?i))
                 (unhappy ?b))
  )

  ;; memory: agent ?a observes item ?i at location ?l and gains knowledge of that item.
  (:action memory
    :parameters (?a - agent ?i - item ?l - location)
    :precondition (and (at ?a ?l) (at-item ?i ?l))
    :effect (knows ?a ?i)
  )

  ;; tightfisted: agent ?a becomes unwilling to perform paltry actions for any item ?i.
  ;; This action requires the agent to currently hold the item ?i; afterwards they are marked not willing.
  (:action tightfisted
    :parameters (?a - agent ?i - item)
    :precondition (and (has ?a ?i))
    :effect (and (not (willing ?a))
                 (tight ?a ?i))
  )
)