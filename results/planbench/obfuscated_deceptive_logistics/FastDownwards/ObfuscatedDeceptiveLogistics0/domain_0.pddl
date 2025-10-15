(define (domain multiagent_domain)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
  (:types agent object slot)

  (:predicates
    (agent ?a - agent)
    (object ?o - object)
    (slot ?s - slot)

    (has ?a - agent ?o - object)
    (liquid ?o - object)
    (available ?s - slot)
    (used ?s - slot)

    (saw ?a - agent ?o - object)
    (transferable ?o - object ?from - agent ?to - agent)
    (remembered ?a - agent ?o1 - object ?o2 - object)
    (damaged ?o - object)
    (paltry-allowed ?a - agent)

    (next ?o1 - object ?o2 - object)
  )

  ;; paltry: agent marks an object as "paltry" (no planner-visible numeric effects),
  ;; modeled by enabling a marker predicate; this action requires the agent to hold the object
  ;; and the agent to be allowed to perform paltry.
  (:action paltry
    :parameters (?ag - agent ?o - object)
    :precondition (and (agent ?ag) (object ?o) (has ?ag ?o) (paltry-allowed ?ag))
    :effect (and) ;; no direct effect required for the planner's goal, kept as a no-op marker
  )

  ;; sip: agent takes (acquires) a liquid object from an available slot and consumes the slot.
  ;; The slot becomes used (not available) after sip.
  (:action sip
    :parameters (?ag - agent ?o - object ?s - slot)
    :precondition (and (agent ?ag) (object ?o) (slot ?s) (liquid ?o) (available ?s))
    :effect (and (has ?ag ?o) (used ?s) (not (available ?s)))
  )

  ;; clip: agent arranges two objects so that next ?o1 ?o2 holds.
  ;; Requires the agent to hold both objects.
  (:action clip
    :parameters (?ag - agent ?o1 - object ?o2 - object)
    :precondition (and (agent ?ag) (has ?ag ?o1) (has ?ag ?o2) (object ?o1) (object ?o2) (not (next ?o1 ?o2)))
    :effect (and (next ?o1 ?o2))
  )

  ;; memory: if an agent has seen two objects, the agent can record their adjacency (next).
  (:action memory
    :parameters (?ag - agent ?o1 - object ?o2 - object)
    :precondition (and (agent ?ag) (saw ?ag ?o1) (saw ?ag ?o2) (not (next ?o1 ?o2)))
    :effect (and (next ?o1 ?o2) (remembered ?ag ?o1 ?o2))
  )

  ;; wretched: agent discards or damages an object it holds; object is no longer held and becomes damaged.
  (:action wretched
    :parameters (?ag - agent ?o - object)
    :precondition (and (agent ?ag) (has ?ag ?o))
    :effect (and (damaged ?o) (not (has ?ag ?o)))
  )

  ;; tightfisted: agent refuses transfer of an object to another agent by removing the transferable relation.
  (:action tightfisted
    :parameters (?from - agent ?to - agent ?o - object)
    :precondition (and (agent ?from) (agent ?to) (object ?o) (has ?from ?o) (transferable ?o ?from ?to))
    :effect (and (not (transferable ?o ?from ?to)))
  )
)