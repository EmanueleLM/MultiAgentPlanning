(define (domain blocksworld-temporal)
  (:requirements :strips :typing :negative-preconditions)
  (:types loc block - loc slot)

  (:predicates
    ;; core block-world predicates
    (on ?b - block ?p - loc)     ;; block b is directly on location p (either table or another block)
    (clear ?b - block)           ;; no block is on top of b (and b is not held)
    (holding ?b - block)         ;; hand is holding block b
    (handempty)                  ;; hand is empty

    ;; explicit discrete stage progression
    (current ?s - slot)          ;; current stage/slot
    (slot-next ?s1 - slot ?s2 - slot) ;; strict successor relation between slots
  )

  ;; Pick up a block that is on the table and clear.
  ;; Advances the current slot to its immediate successor (enforces contiguous stage progression).
  (:action pickup
    :parameters (?b - block ?s - slot ?s2 - slot)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (current ?s)
      (slot-next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b table))
      (not (clear ?b))     ;; held blocks are not considered clear
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
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (clear ?c)           ;; removing the top block makes the lower block clear
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
      (on ?b table)
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
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))    ;; destination is no longer clear
      (clear ?b)          ;; the newly placed block is clear (nothing on top)
      (handempty)
      (not (holding ?b))

      ;; advance the stage marker
      (not (current ?s))
      (current ?s2)
    )
  )
)