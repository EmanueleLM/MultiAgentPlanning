(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?p - block)       ; block ?b is directly on place ?p (place modeled as block; table is a block object)
    (clear ?b - block)               ; nothing on top of block ?b
    (holding ?a - agent ?b - block)  ; agent ?a is holding block ?b
    (handempty ?a - agent)           ; agent ?a has empty hand
  )

  ;; Unstack a block ?b from another block ?below (take from top of stack)
  (:action unstack
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?below))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?below)
    )
  )

  ;; Pick up a block ?b from the table (table is represented by the special object 'table')
  (:action pickup-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b table))
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  ;; Stack a held block ?b onto a target block ?target (target must be clear)
  (:action stack-onto-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (holding ?a ?b)
      (clear ?target)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b ?target)
      (handempty ?a)
      (not (clear ?target))
      (clear ?b)
    )
  )

  ;; Put a held block ?b down onto the table (no clear requirement for the table)
  (:action put-down-on-table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (holding ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (on ?b table)
      (handempty ?a)
      (clear ?b)
    )
  )
)