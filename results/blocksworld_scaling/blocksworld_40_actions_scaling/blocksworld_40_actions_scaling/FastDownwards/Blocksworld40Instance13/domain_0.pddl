(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  ;; Agent picks up a clear block from the table
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

  ;; Agent un-stacks a clear block from another block
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
              (holding ?a ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty ?a))
            )
  )

  ;; Agent stacks a held block onto a clear block
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

  ;; Agent puts down a held block onto the table
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
)