(define (domain social_actions)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    object
    container - object
    consumable - container
    item target - object
    entity
    info
  )

  (:predicates
    (holds ?a - agent ?o - object)
    (attachable ?it - item ?tgt - target)
    (attached ?it - item ?tgt - target)
    (low_value ?o - object)
    (consumable ?c - consumable)
    (empty ?c - container)
    (sipped ?a - agent ?c - consumable)
    (wretched ?e - entity)
    (remembered ?a - agent ?m - info)
    (tightfisted ?a - agent)
    (next ?o1 - object ?o2 - object)
  )

  (:action paltry
    :parameters (?a - agent ?x - object)
    :precondition (and (holds ?a ?x) (not (low_value ?x)))
    :effect (and (low_value ?x))
  )

  (:action sip
    :parameters (?a - agent ?d - consumable)
    :precondition (and (holds ?a ?d) (consumable ?d) (not (empty ?d)))
    :effect (and (sipped ?a ?d))
  )

  (:action clip
    :parameters (?a - agent ?it - item ?tgt - target)
    :precondition (and (holds ?a ?it) (attachable ?it ?tgt) (not (attached ?it ?tgt)))
    :effect (and (attached ?it ?tgt) (not (holds ?a ?it)))
  )

  (:action wretched
    :parameters (?x - entity)
    :precondition (not (wretched ?x))
    :effect (wretched ?x)
  )

  (:action memory
    :parameters (?a - agent ?m - info)
    :precondition (not (remembered ?a ?m))
    :effect (remembered ?a ?m)
  )

  (:action tightfisted
    :parameters (?a - agent)
    :precondition (not (tightfisted ?a))
    :effect (tightfisted ?a)
  )

  ; Explicit operator to establish a next relation between two objects.
  (:action make-next
    :parameters (?x - object ?y - object)
    :precondition (not (next ?x ?y))
    :effect (next ?x ?y)
  )
)