(define (domain multi-agent-delivery)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location object)

  (:predicates
    (at ?a - agent ?l - location)                    ; agent is at location
    (obj-at ?o - object ?l - location)               ; object is at location
    (holding ?a - agent ?o - object)                 ; agent holds object
    (delivered ?o - object)                          ; object has been delivered to its goal
    (connected ?l1 - location ?l2 - location)       ; direct connection between locations (movement allowed)
    (goal-loc ?o - object ?l - location)             ; designated delivery location for an object
  )

  ; Generic move action usable by either agent
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  ; Actions originating from planner_A (kept distinct to reflect role-specific capabilities)
  (:action planner_A_pick
    :parameters (?o - object ?l - location)
    :precondition (and
      (at planner_A ?l)
      (obj-at ?o ?l)
      (not (holding planner_A ?o))
    )
    :effect (and
      (not (obj-at ?o ?l))
      (holding planner_A ?o)
    )
  )

  (:action planner_A_drop
    :parameters (?o - object ?l - location)
    :precondition (and
      (at planner_A ?l)
      (holding planner_A ?o)
    )
    :effect (and
      (not (holding planner_A ?o))
      (obj-at ?o ?l)
    )
  )

  (:action planner_A_deliver
    :parameters (?o - object ?l - location)
    :precondition (and
      (at planner_A ?l)
      (holding planner_A ?o)
      (goal-loc ?o ?l)
    )
    :effect (and
      (not (holding planner_A ?o))
      (delivered ?o)
      (obj-at ?o ?l)
    )
  )

  ; Actions originating from planner_B (kept distinct to reflect role-specific capabilities)
  (:action planner_B_pick
    :parameters (?o - object ?l - location)
    :precondition (and
      (at planner_B ?l)
      (obj-at ?o ?l)
      (not (holding planner_B ?o))
    )
    :effect (and
      (not (obj-at ?o ?l))
      (holding planner_B ?o)
    )
  )

  (:action planner_B_drop
    :parameters (?o - object ?l - location)
    :precondition (and
      (at planner_B ?l)
      (holding planner_B ?o)
    )
    :effect (and
      (not (holding planner_B ?o))
      (obj-at ?o ?l)
    )
  )

  (:action planner_B_deliver
    :parameters (?o - object ?l - location)
    :precondition (and
      (at planner_B ?l)
      (holding planner_B ?o)
      (goal-loc ?o ?l)
    )
    :effect (and
      (not (holding planner_B ?o))
      (delivered ?o)
      (obj-at ?o ?l)
    )
  )
)