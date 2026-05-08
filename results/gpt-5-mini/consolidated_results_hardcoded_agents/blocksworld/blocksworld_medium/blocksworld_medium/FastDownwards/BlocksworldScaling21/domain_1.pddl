(define (domain blocksworld-temporal)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place slot)

  (:predicates
    ;; core block-world predicates
    (on ?b - block ?p - place)        ;; block b is directly on place p (place = table or another block)
    (clear ?b - block)                ;; no block is on top of b
    (holding ?b - block)              ;; hand is holding block b
    (handempty)                       ;; hand is empty

    ;; explicit discrete time / stage bookkeeping (structural, no penalty tokens)
    (current ?s - slot)               ;; the planner is currently at slot s
    (slot-next ?s1 - slot ?s2 - slot) ;; strict successor relation between slots
    (slot-free ?s - slot)             ;; slot s has not yet been consumed by an action
  )

  ;; Pick up a block that is on the table and clear.
  ;; Consumes the current slot and advances the current marker to the successor slot.
  (:action pickup
    :parameters (?b - block ?s - slot ?s2 - slot)
    :precondition (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (current ?s)
      (slot-next ?s ?s2)
      (slot-free ?s)
    )
    :effect (and
      (holding ?b)
      (not (on ?b table))
      (not (clear ?b))     ;; held blocks are not clear per domain definition
      (not (handempty))

      ;; consume and advance the slot token (structural temporal ordering)
      (not (slot-free ?s))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a block from on top of another block.
  ;; Makes the supporting block clear, consumes the slot and advances.
  (:action unstack
    :parameters (?b - block ?c - block ?s - slot ?s2 - slot)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (current ?s)
      (slot-next ?s ?s2)
      (slot-free ?s)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (clear ?c)           ;; removing top block makes the lower block clear
      (not (clear ?b))
      (not (handempty))

      ;; consume and advance the slot token
      (not (slot-free ?s))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table.
  ;; Produces a clear block and frees the hand; consumes and advances the slot.
  (:action putdown
    :parameters (?b - block ?s - slot ?s2 - slot)
    :precondition (and
      (holding ?b)
      (current ?s)
      (slot-next ?s ?s2)
      (slot-free ?s)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (handempty)
      (not (holding ?b))

      ;; consume and advance the slot token
      (not (slot-free ?s))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block on top of a clear block.
  ;; The destination block becomes not clear. Consumes and advances the slot.
  (:action stack
    :parameters (?b - block ?c - block ?s - slot ?s2 - slot)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (current ?s)
      (slot-next ?s ?s2)
      (slot-free ?s)
    )
    :effect (and
      (on ?b ?c)
      (not (clear ?c))    ;; once something is stacked, the destination is no longer clear
      (clear ?b)
      (handempty)
      (not (holding ?b))

      ;; consume and advance the slot token
      (not (slot-free ?s))
      (not (current ?s))
      (current ?s2)
    )
  )
)