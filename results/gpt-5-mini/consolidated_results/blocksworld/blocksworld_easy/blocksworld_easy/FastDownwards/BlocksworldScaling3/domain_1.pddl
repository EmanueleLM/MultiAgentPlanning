(define (domain blocksworld-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block phase)

  (:predicates
    (on ?b - block ?b2 - block)        ; block on block
    (ontable ?b - block)              ; block on table
    (clear ?b - block)                ; no block on top and not held
    (holding ?b - block)              ; block held in the single hand
    (handempty)                       ; the single hand is empty
    (current ?ph - phase)             ; current stage/phase
    (next ?ph1 - phase ?ph2 - phase)  ; successor relation between phases
  )

  ;; Pick up a clear block from the table.
  ;; Preconditions:
  ;;  - the block is on the table,
  ;;  - the block is clear (no block on top and not currently held),
  ;;  - the hand is empty,
  ;;  - the action is executed in the current phase and that phase has a successor.
  ;; Effects:
  ;;  - the block is no longer on the table,
  ;;  - the block is held,
  ;;  - the block is not clear while held,
  ;;  - the hand becomes not empty,
  ;;  - advance the current phase to its successor.
  (:action pickup
    :parameters (?b - block ?ph - phase ?ph2 - phase)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?ph)
      (next ?ph ?ph2)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (clear ?b))
      (not (handempty))
      (not (current ?ph))
      (current ?ph2)
    )
  )

  ;; Unstack a clear block from on top of another block.
  ;; Preconditions:
  ;;  - the block to unstack is directly on another block,
  ;;  - the block to unstack is clear,
  ;;  - the hand is empty,
  ;;  - current phase and successor exist.
  ;; Effects:
  ;;  - remove the on relation between the two blocks,
  ;;  - the block being unstacked becomes held (and not clear),
  ;;  - the block that was below becomes clear (no block on top),
  ;;  - the hand becomes not empty,
  ;;  - advance phase.
  (:action unstack
    :parameters (?b - block ?under - block ?ph - phase ?ph2 - phase)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (handempty)
      (current ?ph)
      (next ?ph ?ph2)
    )
    :effect (and
      (not (on ?b ?under))
      (holding ?b)
      (not (clear ?b))
      (clear ?under)
      (not (handempty))
      (not (current ?ph))
      (current ?ph2)
    )
  )

  ;; Put the held block down on the table.
  ;; Preconditions:
  ;;  - the block is held,
  ;;  - current phase and successor exist.
  ;; Effects:
  ;;  - the block becomes on the table,
  ;;  - the block becomes clear (nothing on top and not held),
  ;;  - the block is no longer held,
  ;;  - the hand becomes empty,
  ;;  - advance phase.
  (:action putdown
    :parameters (?b - block ?ph - phase ?ph2 - phase)
    :precondition (and
      (holding ?b)
      (current ?ph)
      (next ?ph ?ph2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (current ?ph))
      (current ?ph2)
    )
  )

  ;; Stack the held block onto a clear block.
  ;; Preconditions:
  ;;  - the block being stacked is held,
  ;;  - the target block is clear,
  ;;  - current phase and successor exist.
  ;; Effects:
  ;;  - the held block becomes on the target block,
  ;;  - the target block becomes not clear,
  ;;  - the stacked block becomes clear (unless something is placed on it later),
  ;;  - the held block is no longer held,
  ;;  - the hand becomes empty,
  ;;  - advance phase.
  (:action stack
    :parameters (?b - block ?target - block ?ph - phase ?ph2 - phase)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (current ?ph)
      (next ?ph ?ph2)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding ?b))
      (handempty)
      (not (current ?ph))
      (current ?ph2)
    )
  )
)