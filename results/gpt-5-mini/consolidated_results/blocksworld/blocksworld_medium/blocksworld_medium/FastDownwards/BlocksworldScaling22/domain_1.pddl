(define (domain orchestrated_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?under - block)       ; ?b is directly on ?under
    (ontable ?b - block)                 ; ?b is directly on the table
    (clear ?b - block)                   ; no block is on top of ?b and it is not being held
    (holding ?a - agent ?b - block)      ; agent ?a is holding block ?b
    (handempty ?a - agent)               ; agent ?a holds nothing
  )

  ;; Pick up a block from the table
  (:action pickup
    :parameters (?a - agent ?b - block)
    :precondition (and
      (handempty ?a)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (handempty ?a))
      (holding ?a ?b)
      (not (ontable ?b))
      (not (clear ?b))
    )
  )

  ;; Unstack a block from on top of another block
  (:action unstack
    :parameters (?a - agent ?b - block ?under - block)
    :precondition (and
      (handempty ?a)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (handempty ?a))
      (holding ?a ?b)
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?a - agent ?b - block)
    :precondition (and
      (holding ?a ?b)
    )
    :effect (and
      (handempty ?a)
      (not (holding ?a ?b))
      (ontable ?b)
      (clear ?b)
    )
  )

  ;; Stack a held block on top of another clear block
  (:action stack
    :parameters (?a - agent ?b - block ?under - block)
    :precondition (and
      (holding ?a ?b)
      (clear ?under)
    )
    :effect (and
      (handempty ?a)
      (not (holding ?a ?b))
      (on ?b ?under)
      (not (clear ?under))
      (clear ?b)
    )
  )
)