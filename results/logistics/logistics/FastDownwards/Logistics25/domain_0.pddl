(define (domain multiagent_placement)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object location)

  (:predicates
    (at ?x - object ?l - location)        ; object at location
    (at-agent ?a - agent ?l - location)  ; agent at location
    (holding ?a - agent ?o - object)     ; agent holding object
    (handfree ?a - agent)                ; agent has free hand
    (next ?o1 - object ?o2 - object)     ; object o1 is next to object o2
  )

  ;; Move an agent between locations
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and (at-agent ?a ?from) (not (= ?from ?to)))
    :effect (and (at-agent ?a ?to) (not (at-agent ?a ?from)))
  )

  ;; Agent picks up an object at the agent's location (hand must be free)
  (:action pickup
    :parameters (?a - agent ?o - object ?l - location)
    :precondition (and (at-agent ?a ?l) (at ?o ?l) (handfree ?a))
    :effect (and (holding ?a ?o) (not (handfree ?a)) (not (at ?o ?l)))
  )

  ;; Agent places an object so that it becomes "next" to another object located at the same place
  (:action put-next
    :parameters (?a - agent ?o1 - object ?o2 - object ?l - location)
    :precondition (and (at-agent ?a ?l) (at ?o2 ?l) (holding ?a ?o1))
    :effect (and
              (next ?o1 ?o2)
              (at ?o1 ?l)
              (not (holding ?a ?o1))
              (handfree ?a)
            )
  )

  ;; Agent can put an object down at their location without creating a 'next' relation
  (:action putdown
    :parameters (?a - agent ?o - object ?l - location)
    :precondition (and (at-agent ?a ?l) (holding ?a ?o))
    :effect (and (at ?o ?l) (not (holding ?a ?o)) (handfree ?a))
  )
)