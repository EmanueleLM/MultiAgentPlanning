(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (handempty)
    (holding ?b - block)
    (clear ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
  )

  ;; Pick up a block from the table with the single hand.
  (:action pick-up
    :parameters (?x - block)
    :precondition (and
      (on-table ?x)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (not (on-table ?x))
      (not (handempty))
      (holding ?x)
      ;; ?x remains clear while held (no block on top of it).
      ;; No effect on other blocks except those explicitly mentioned.
    )
  )

  ;; Put the held block down on the table.
  (:action put-down
    :parameters (?x - block)
    :precondition (and
      (holding ?x)
    )
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; Stack the held block onto another clear block.
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding ?x)
      (clear ?y)
      ;; prevent stacking a block onto itself
      (not (on ?y ?x))
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
    )
  )

  ;; Unstack a clear block from on top of another block using the single hand.
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      ;; ?x remains clear while held
    )
  )
)