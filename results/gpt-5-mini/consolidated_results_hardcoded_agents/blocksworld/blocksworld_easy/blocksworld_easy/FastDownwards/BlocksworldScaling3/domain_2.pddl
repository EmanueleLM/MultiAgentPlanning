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

  ;; Picker: pick up a clear block from the table.
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

  ;; Stacker: unstack a clear block that is directly on another block.
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

  ;; Picker: put the held block down on the table.
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

  ;; Stacker: stack the held block onto a clear block.
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