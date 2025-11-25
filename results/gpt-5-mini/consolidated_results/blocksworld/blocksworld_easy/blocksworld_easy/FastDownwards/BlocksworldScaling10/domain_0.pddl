(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (ontable ?b - block)
    (on ?x - block ?y - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
  )

  ;; Pick up a block from the table into the single hand.
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (not (ontable ?x))
      (not (handempty))
      (holding ?x)
    )
  )

  ;; Put a held block down onto the table.
  (:action put-down
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; Stack a held block onto another clear block.
  (:action stack
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

  ;; Unstack a block from on top of another block into the single hand.
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
    )
  )
)