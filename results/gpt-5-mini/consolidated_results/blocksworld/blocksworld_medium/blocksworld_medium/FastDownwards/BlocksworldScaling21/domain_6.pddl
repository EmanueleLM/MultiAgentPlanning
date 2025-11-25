(define (domain blocksworld-temporal)
  (:requirements :strips :typing :negative-preconditions)
  (:types block slot)

  (:predicates
    ;; a block b is directly on another block c
    (on ?b - block ?c - block)
    ;; a block b is directly on the table
    (on-table ?b - block)
    ;; nothing is on top of block b (and b is not held)
    (clear ?b - block)
    ;; the hand is holding block b
    (holding ?b - block)
    ;; the hand is empty
    (handempty)
    ;; explicit discrete stage progression: current slot
    (current ?s - slot)
    ;; immediate successor relation between slots (enforces contiguous progression)
    (slot-next ?s1 - slot ?s2 - slot)
  )

  ;; Pick up a block that is on the table and clear.
  ;; Advances the current slot to its immediate successor (enforces contiguous stage progression).
  (:action pickup
    :parameters (?b - block ?s - slot ?s2 - slot)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (handempty)
      (current ?s)
      (slot-next ?s ?s2)
      ;; ensure the block is not already held (explicit negative precondition)
      (not (holding ?b))
    )
    :effect (and
      (holding ?b)
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty))

      ;; advance the stage marker
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block.
  ;; Advances the current slot to its immediate successor.
  (:action unstack
    :parameters (?b - block ?c - block ?s - slot ?s2 - slot)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?s)
      (slot-next ?s ?s2)
      ;; ensure the block being unstacked is not already held
      (not (holding ?b))
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (handempty))

      ;; advance the stage marker
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table.
  ;; Advances the current slot to its immediate successor.
  (:action putdown
    :parameters (?b - block ?s - slot ?s2 - slot)
    :precondition (and
      (holding ?b)
      (current ?s)
      (slot-next ?s ?s2)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))

      ;; advance the stage marker
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block on top of a clear block.
  ;; The destination block becomes not clear. Advances the current slot to successor.
  (:action stack
    :parameters (?b - block ?c - block ?s - slot ?s2 - slot)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?s)
      (slot-next ?s ?s2)
      ;; destination block must not be currently held
      (not (holding ?c))
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (handempty)
      (not (holding ?b))

      ;; advance the stage marker
      (not (current ?s))
      (current ?s2)
    )
  )
)