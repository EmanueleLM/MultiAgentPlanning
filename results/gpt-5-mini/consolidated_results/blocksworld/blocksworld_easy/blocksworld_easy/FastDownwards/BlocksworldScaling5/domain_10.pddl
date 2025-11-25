(define (domain blocksworld-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    block place - support
    stage
  )

  (:predicates
    (on ?b - block ?s - support)     ; block ?b is directly on support ?s (support = block or place)
    (clear ?b - block)               ; no block on top of ?b and ?b is not held
    (holding ?b - block)             ; the manipulator is holding block ?b
    (hand-empty)                     ; the manipulator's hand is empty
    (succ ?s1 - stage ?s2 - stage)   ; temporal successor relation between stages
    (current ?s - stage)             ; the current stage/timepoint
  )

  ;; Pick up a block from the table (place) when hand is empty and the block is clear.
  ;; Advances time from ?s to its immediate successor ?s2 (contiguous stage progression).
  (:action pick-up
    :parameters (?b - block ?p - place ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand-empty)
      (clear ?b)
      (on ?b ?p)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (holding ?b)
      (not (hand-empty))

      (not (on ?b ?p))
      (not (clear ?b))
    )
  )

  ;; Unstack a clear block from on top of another block when hand is empty.
  ;; Leaves the supporting block clear because the top block is removed.
  (:action unstack
    :parameters (?b - block ?support - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand-empty)
      (clear ?b)
      (on ?b ?support)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (holding ?b)
      (not (hand-empty))

      (not (on ?b ?support))
      (not (clear ?b))

      (clear ?support)
    )
  )

  ;; Put down a held block onto a place (table).
  ;; Places the block on the specified place and makes it clear (no block on top).
  (:action put-down
    :parameters (?b - block ?p - place ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (on ?b ?p)
      (clear ?b)

      (hand-empty)
      (not (holding ?b))
    )
  )

  ;; Stack a held block onto a clear supporting block.
  ;; The supporting block becomes not clear; the stacked block becomes clear.
  ;; Prevent stacking a block onto itself.
  (:action stack
    :parameters (?b - block ?support - block ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (holding ?b)
      (clear ?support)
      (not (= ?b ?support))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (on ?b ?support)
      (clear ?b)

      (hand-empty)
      (not (holding ?b))

      (not (clear ?support))
    )
  )
)