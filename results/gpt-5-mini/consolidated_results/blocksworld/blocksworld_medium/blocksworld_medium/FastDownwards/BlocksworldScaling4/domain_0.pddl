(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (neq ?x - block ?y - block)
  )

  ;; Pickup: pick a clear block from the table into the single hand.
  (:action pickup
    :parameters (?x - block)
    :precondition (and (handempty) (ontable ?x) (clear ?x))
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (ontable ?x))
      (not (clear ?x))
    )
  )

  ;; Unstack: pick a clear block that is on another block.
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (handempty) (on ?x ?y) (clear ?x) (neq ?x ?y))
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
    )
  )

  ;; Putdown: put a held block onto the table.
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

  ;; Stack: place a held block onto another clear block (no self-placement).
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y) (neq ?x ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (ontable ?x))
    )
  )
)