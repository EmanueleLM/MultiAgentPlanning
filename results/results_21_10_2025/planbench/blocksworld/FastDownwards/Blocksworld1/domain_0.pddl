(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place)
  (:predicates
    (on ?b - block ?p - place)    ; a block is on another block or on the table (table is a place)
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