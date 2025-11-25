(define (domain blocksworld-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block phase)

  (:predicates
    (on ?b - block ?b2 - block)        ; ?b is directly on ?b2
    (ontable ?b - block)               ; ?b is on the table
    (clear ?b - block)                 ; no block on top of ?b and ?b is not held
    (holding ?b - block)               ; the single hand is holding ?b
    (handempty)                        ; the single hand is empty
    (current ?ph - phase)              ; current stage/phase
    (next ?ph1 - phase ?ph2 - phase)   ; successor relation between phases
  )

  ;; Picker: pick up a clear block from the table (advances the phase).
  ;; Preconditions: block must be on the table, clear, hand empty, and current phase must have a successor.
  ;; Effects: block is removed from table, becomes held (not clear), hand becomes non-empty,
  ;; and the current phase advances to the successor.
  (:action picker-pickup
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

  ;; Stacker: unstack a clear block that is directly on another block (advances the phase).
  ;; Preconditions: block is on another block, is clear, hand empty, and current phase must have a successor.
  ;; Effects: remove the on relation, the block becomes held (not clear), the under-block becomes clear,
  ;; hand becomes non-empty, and phase advances to the successor.
  (:action stacker-unstack
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

  ;; Picker: put the held block down on the table (advances the phase).
  ;; Preconditions: holding the block and current phase has a successor.
  ;; Effects: block becomes on the table and clear, hand becomes empty, and phase advances.
  (:action picker-putdown
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

  ;; Stacker: stack the held block onto a clear block (advances the phase).
  ;; Preconditions: holding the block, target is clear, and current phase has a successor.
  ;; Effects: held block becomes on the target, the stacked block is clear (no block on top of it),
  ;; the target becomes not clear, hand becomes empty, and phase advances.
  (:action stacker-stack
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