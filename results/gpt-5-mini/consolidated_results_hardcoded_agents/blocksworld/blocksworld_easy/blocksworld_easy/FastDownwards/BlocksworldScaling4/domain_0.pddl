(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent support block table - support)

  (:predicates
    (on ?b - block ?p - support)       ; block ?b is on support ?p (another block or the table)
    (clear ?b - block)                ; block ?b has no block on top of it
    (handempty ?a - agent)            ; agent ?a's gripper/hand is empty
    (holding ?a - agent ?b - block)   ; agent ?a is holding block ?b
  )

  ; Pick up a block that is on top of another block
  (:action pickup-from-block
    :parameters (?a - agent ?b - block ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?under))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?under)    ; underlying block becomes clear after removing the top block
      (not (clear ?b))  ; a held block is not considered clear on a support
    )
  )

  ; Pick up a block that is on the table
  (:action pickup-from-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (on ?b ?t)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?t))
      (not (handempty ?a))
      (holding ?a ?b)
      (not (clear ?b))  ; a held block is not considered clear on a support
    )
  )

  ; Place a held block onto another block (stack)
  (:action place-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (holding ?a ?b)
      (clear ?target)
      (not (= ?b ?target))   ; explicit prohibition of placing a block onto itself
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?target)
      (not (clear ?target))  ; target now has something on top
      (clear ?b)             ; newly placed block is clear (top of stack)
    )
  )

  ; Place a held block onto the table (unstack to table)
  (:action place-on-table
    :parameters (?a - agent ?b - block ?t - table)
    :precondition (and
      (holding ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?t)
      (clear ?b)
    )
  )
)