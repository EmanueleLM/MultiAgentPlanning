(define (domain multiagent-stack)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:constants a1 a2 - agent)

  (:predicates
    (on ?b - block ?b2 - block)        ; block ?b is directly on block ?b2
    (ontable ?b - block)               ; block ?b is directly on the table
    (clear ?b - block)                 ; nothing is on top of block ?b
    (holding ?a - agent ?b - block)    ; agent ?a is holding block ?b
    (handfree ?a - agent)              ; agent ?a has an empty hand
  )

  ;; Agent A1 actions (agent-contributed actions are kept distinct)
  (:action pickup-a1
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handfree a1))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handfree a1))
              (holding a1 ?x)
            )
  )

  (:action unstack-a1
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handfree a1))
    :effect (and
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handfree a1))
              (holding a1 ?x)
              (clear ?y)
            )
  )

  (:action putdown-a1
    :parameters (?x - block)
    :precondition (and (holding a1 ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handfree a1)
              (not (holding a1 ?x))
            )
  )

  (:action stack-a1
    :parameters (?x - block ?y - block)
    :precondition (and (holding a1 ?x) (clear ?y))
    :effect (and
              (not (clear ?y))
              (on ?x ?y)
              (clear ?x)
              (handfree a1)
              (not (holding a1 ?x))
            )
  )

  ;; Agent A2 actions (distinct from A1's actions)
  (:action pickup-a2
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handfree a2))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handfree a2))
              (holding a2 ?x)
            )
  )

  (:action unstack-a2
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handfree a2))
    :effect (and
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handfree a2))
              (holding a2 ?x)
              (clear ?y)
            )
  )

  (:action putdown-a2
    :parameters (?x - block)
    :precondition (and (holding a2 ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handfree a2)
              (not (holding a2 ?x))
            )
  )

  (:action stack-a2
    :parameters (?x - block ?y - block)
    :precondition (and (holding a2 ?x) (clear ?y))
    :effect (and
              (not (clear ?y))
              (on ?x ?y)
              (clear ?x)
              (handfree a2)
              (not (holding a2 ?x))
            )
  )
)