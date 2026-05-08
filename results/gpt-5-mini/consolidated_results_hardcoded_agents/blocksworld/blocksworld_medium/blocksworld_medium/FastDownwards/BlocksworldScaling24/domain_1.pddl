(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
  )

  ;; Pick up a clear block from the table (operator action)
  (:action operator_pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ;; Unstack a clear block from on top of another block (operator action)
  (:action operator_unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ;; Put down a block from the hand onto the table (operator action)
  (:action operator_putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
            )
  )

  ;; Stack a held block onto a clear block (operator action)
  (:action operator_stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (clear ?y))
            )
  )
)