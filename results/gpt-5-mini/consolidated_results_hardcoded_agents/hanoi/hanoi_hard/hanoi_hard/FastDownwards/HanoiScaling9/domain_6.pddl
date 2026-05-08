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

    ;; step sequencing control: exactly one action consumes the current step token and produces its successor
    (at-step ?s - step)
    (succ ?s - step ?s2 - step)
  )

  ;; Move a top disk from a support (peg or disk) onto an empty peg.
  ;; Requires the moved disk to be top (clear) and advances the explicit step token.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?snext - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?snext)

      ;; disk is directly on ?from and is the top disk
      (on ?d ?from)
      (clear ?d)

      ;; destination peg must be empty (no disk directly on it)
      (clear ?to)

      ;; forbid vacuous moves (prevents from==to or moving to current support)
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
  ;; Requires the target disk to be the top disk and strictly larger; advances the explicit step token.
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

      ;; forbid vacuous moves (prevents from==to or moving to same support)
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