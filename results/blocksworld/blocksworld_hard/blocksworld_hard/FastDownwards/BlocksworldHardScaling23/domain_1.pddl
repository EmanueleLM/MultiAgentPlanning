(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (hand-empty)
  )

  ; Pick up a block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (on-table ?x) (hand-empty))
    :effect (and (holding ?x)
                 (not (clear ?x))
                 (not (on-table ?x))
                 (not (hand-empty))
            )
  )

  ; Unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
    :effect (and (holding ?x)
                 (clear ?y)
                 (not (on ?x ?y))
                 (not (clear ?x))
                 (not (hand-empty))
            )
  )

  ; Put down a block onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (hand-empty)
                 (on-table ?x)
                 (clear ?x)
                 (not (holding ?x))
            )
  )

  ; Stack a block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (hand-empty)
                 (on ?x ?y)
                 (clear ?x)
                 (not (clear ?y))
                 (not (holding ?x))
            )
  )
)