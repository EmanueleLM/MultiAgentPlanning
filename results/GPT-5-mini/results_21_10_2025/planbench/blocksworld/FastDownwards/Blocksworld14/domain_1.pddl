(define (domain blocksworld14)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)     ; ?x is on top of ?y
    (on-table ?x - block)         ; ?x is directly on the table
    (clear ?x - block)            ; nothing on top of ?x
    (holding ?x - block)          ; the agent is holding ?x
    (hand-empty)                  ; the agent's hand is empty
  )

  ;; Pick up a block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (on-table ?x) (clear ?x) (hand-empty))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (hand-empty))
    )
  )

  ;; Put a held block down on the table
  (:action put-down
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (hand-empty)
      (not (holding ?x))
    )
  )

  ;; Unstack a block from another block
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