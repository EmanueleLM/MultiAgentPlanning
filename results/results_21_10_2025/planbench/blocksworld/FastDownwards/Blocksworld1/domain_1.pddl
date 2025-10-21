(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  ;; Type hierarchy: blocks are also places so a block can be the support for another block,
  ;; and the table is a place.
  (:types place block - place)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place ?p (place may be table or another block)
    (clear ?b - block)            ; no block on top of ?b and ?b is not being held
    (holding ?b - block)          ; the agent is holding ?b
    (handempty)                   ; the agent's hand is empty
  )

  ;; Pick up a clear block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and
      (handempty)
      (clear ?b)
      (on ?b table)
    )
    :effect (and
      (holding ?b)
      (not (on ?b table))
      ;; while held, the block is not considered clear
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Unstack a clear block ?b from on top of another block ?c
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (handempty)
      (clear ?b)
      (on ?b ?c)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      ;; the block that was supporting ?b becomes clear after removing ?b
      (clear ?c)
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Stack a held block ?b onto a clear block ?c
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )
)