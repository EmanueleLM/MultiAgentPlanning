(define (domain blocks-world)
  (:requirements :typing :strips)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Pick up a clear block from the table
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

  ;; Put down a held block on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (not (holding ?x))
      (ontable ?x)
      (clear ?x)
      (handempty)
    )
  )

  ;; Unstack a clear block from another block (pick it up)
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
    )
  )

  ;; Stack a held block onto a clear block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (not (holding ?x))
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
  )
)