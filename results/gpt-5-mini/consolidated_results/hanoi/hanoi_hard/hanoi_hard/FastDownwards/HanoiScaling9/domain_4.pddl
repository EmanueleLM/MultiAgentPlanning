(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place step - object
    disk peg - place
  )

  (:predicates
    ;; disk ?d is directly on place ?p (peg or disk)
    (on ?d - disk ?p - place)

    ;; true iff nothing is directly on top of this place (peg or disk)
    (clear ?p - place)

    ;; static size ordering: (smaller a b) means a is strictly smaller than b
    (smaller ?a - disk ?b - disk)

    ;; step sequencing control
    (at-step ?s - step)
    (succ ?s - step ?s2 - step)
  )

  ;; Move a top disk from a support (peg or disk) onto an empty peg.
  ;; Enforce explicit stage progression and forbid vacuous moves by requiring the disk is not already on the destination.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?snext - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?snext)

      ;; disk is directly on ?from and is the top disk
      (on ?d ?from)
      (clear ?d)

      ;; destination peg must be clear (no disk directly on it)
      (clear ?to)

      ;; disk must not already be on the destination (prevents vacuous from==to moves without equality usage)
      (not (on ?d ?to))
    )
    :effect (and
      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; former support becomes clear; destination no longer clear
      (clear ?from)
      (not (clear ?to))

      ;; advance step token so exactly one action occurs per step
      (not (at-step ?s))
      (at-step ?snext)
    )
  )

  ;; Move a top disk from a support (peg or disk) onto another disk (must be larger and top).
  ;; Forbid vacuous moves by ensuring the disk is not already on the destination.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?snext - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?snext)

      ;; disk is directly on ?from and is the top disk
      (on ?d ?from)
      (clear ?d)

      ;; destination disk must be top (clear) and strictly larger
      (clear ?to)
      (smaller ?d ?to)

      ;; disk must not already be on the destination (prevents vacuous from==to moves without equality usage)
      (not (on ?d ?to))
    )
    :effect (and
      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; former support becomes clear; destination no longer clear
      (clear ?from)
      (not (clear ?to))

      ;; advance step token so exactly one action occurs per step
      (not (at-step ?s))
      (at-step ?snext)
    )
  )
)