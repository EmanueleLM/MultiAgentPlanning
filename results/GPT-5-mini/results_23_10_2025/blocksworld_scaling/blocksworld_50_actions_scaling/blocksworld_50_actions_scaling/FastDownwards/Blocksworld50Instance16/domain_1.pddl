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
             (not (holding ?x))
             (clear ?x)
             (handempty)
             (ontable ?x)
            )
  )

  ;; stack a held block onto another clear block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
             (not (holding ?x))
             (not (clear ?y))
             (clear ?x)
             (handempty)
             (on ?x ?y)
            )
  )

  ;; unstack a clear block from another block (pick it up)
  (:action unstack
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
)