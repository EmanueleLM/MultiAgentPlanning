(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; pick up a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
            )
  )

  ;; put down a held block onto the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
            )
  )

  ;; unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (handempty))
              (not (clear ?x))
            )
  )

  ;; stack a held block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (handempty)
              (not (holding ?x))
            )
  )
)