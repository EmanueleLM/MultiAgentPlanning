(define (domain blocksworld_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  ;; Unstack a block ?x from block ?y by agent ?a (take ?x into hand)
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  ;; Stack a held block ?x onto block ?y by agent ?a
  (:action stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (holding ?a ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding ?a ?x))
      (handempty ?a)
    )
  )

  ;; Put down a held block ?x onto the table by agent ?a
  (:action putdown
    :parameters (?a - agent ?x - block)
    :precondition (holding ?a ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?a ?x))
      (handempty ?a)
    )
  )

  ;; Pick up a block ?x from the table by agent ?a
  (:action pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )
)