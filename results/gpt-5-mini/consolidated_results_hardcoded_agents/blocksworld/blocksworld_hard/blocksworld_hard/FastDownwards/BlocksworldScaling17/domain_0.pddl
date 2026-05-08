(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (holding ?b - block)
    (clear ?b - block)
    (on ?b1 - block ?b2 - block)
    (ontable ?b - block)
    (handempty)
  )

  ;; Unstack a block ?x from on top of block ?y (take ?x into the hand).
  (:action unstack-block
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

  ;; Stack a held block ?x onto block ?y.
  (:action stack-block
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (holding ?x))
              (not (clear ?y))
              (handempty)
            )
  )

  ;; Pick up a block ?x from the table into the hand.
  (:action pickup-block
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
            )
  )

  ;; Put a held block ?x down on the table.
  (:action putdown-block
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding ?x))
              (handempty)
            )
  )
)