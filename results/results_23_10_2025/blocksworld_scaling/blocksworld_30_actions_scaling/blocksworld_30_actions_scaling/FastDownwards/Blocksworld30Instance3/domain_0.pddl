(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?under - block)       ; block b is on block under
    (ontable ?b - block)                 ; block b is on the table (bottom of a table stack)
    (clear ?b - block)                   ; nothing on top of block b
    (holding ?a - agent ?b - block)      ; agent a holds block b
    (handempty ?a - agent)               ; agent a's hand is empty
    (nooneholding)                       ; globally no block is currently carried
  )

  ;; Remove a top block from another block and hold it
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (nooneholding)
    )
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (nooneholding))
    )
  )

  ;; Pick up a top block from the table and hold it
  (:action pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (nooneholding)
    )
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (not (nooneholding))
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
      (nooneholding)
    )
  )

  ;; Stack a held block onto a clear block
  (:action stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
      (holding ?ag ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (clear ?c))
      (handempty ?ag)
      (nooneholding)
    )
  )
)