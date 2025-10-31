(define (domain blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Pick up a block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Unstack a block from another block (pick it up)
  (:action unstack
    :parameters (?b - block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?from)
      (not (on ?b ?from))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?b - block ?onto - block)
    :precondition (and (holding ?b) (clear ?onto))
    :effect (and
      (on ?b ?onto)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?onto))
    )
  )
)