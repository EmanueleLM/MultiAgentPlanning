(define (domain one_hand_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; block ?x is on block ?y
    (ontable ?x - block)              ; block ?x is on the table
    (clear ?x - block)                ; nothing on top of block ?x
    (holding ?x - block)              ; the single hand is holding block ?x
    (hand-free)                       ; the single hand is free
    (different ?x - block ?y - block) ; helper predicate to enforce distinct blocks (no self-stacking)
  )

  ; Agent A actions (manipulator actions originating from one agent)
  ; Pick a block from the table into the single hand
  (:action pick-up-from-table
    :parameters (?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (hand-free)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (hand-free))
    )
  )

  ; Pick a block from atop another block into the single hand
  (:action pick-up-from-block
    :parameters (?b - block ?support - block)
    :precondition (and
      (on ?b ?support)
      (clear ?b)
      (hand-free)
    )
    :effect (and
      (not (on ?b ?support))
      (clear ?support)
      (not (clear ?b))
      (holding ?b)
      (not (hand-free))
    )
  )

  ; Agent B actions (kept separate to reflect a distinct action origin)
  ; Put the held block down onto the table
  (:action put-down-to-table
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (hand-free)
    )
  )

  ; Stack the held block onto another block (enforced different via predicate)
  (:action stack-onto-block
    :parameters (?b - block ?target - block)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (different ?b ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (holding ?b))
      (not (clear ?target))
      (hand-free)
    )
  )
)