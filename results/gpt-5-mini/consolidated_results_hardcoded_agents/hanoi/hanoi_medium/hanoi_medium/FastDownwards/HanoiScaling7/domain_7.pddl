(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; immediate support relation: disk ?d is immediately on place ?p (peg or disk)
    (on ?d - disk ?p - place)

    ;; true iff nothing is directly on the place (peg or disk)
    (clear ?p - place)

    ;; static size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage progression
    (next ?s - step ?s2 - step)
    (at-step ?s - step)
  )

  ;; Move a top disk from a place (peg or disk) onto an empty peg,
  ;; advancing the explicit stage to the successor step.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)        ;; disk is immediately on 'from'
      (clear ?d)           ;; disk is top (nothing above it)
      (clear ?to)          ;; destination peg is empty (top position clear)
      (next ?s ?s2)
      (at-step ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; occupancy updates: destination no longer clear, source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance global stage (maintains exactly one at-step true)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk from a place (peg or disk) onto another disk (which must be top
  ;; and larger), advancing the explicit stage to the successor step.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)        ;; disk is immediately on 'from'
      (clear ?d)           ;; disk is top (nothing above it)
      (clear ?to)          ;; destination disk is top (nothing above it)
      (smaller ?d ?to)     ;; maintain size ordering: moved disk must be smaller
      (next ?s ?s2)
      (at-step ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; occupancy updates: destination disk no longer clear, source becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance global stage (maintains exactly one at-step true)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)