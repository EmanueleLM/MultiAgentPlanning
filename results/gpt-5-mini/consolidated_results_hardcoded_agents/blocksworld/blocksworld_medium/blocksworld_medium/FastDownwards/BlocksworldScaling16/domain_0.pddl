(define (domain blocks-world)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (hand-empty)
  )

  ;; Pick up a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (clear ?x) (on-table ?x) (hand-empty))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (hand-empty))
    )
  )

  ;; Put a held block down on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (hand-empty)
      (not (holding ?x))
    )
  )

  ;; Unstack a block from another block (pick it up from a stack)
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (hand-empty))
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (hand-empty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)