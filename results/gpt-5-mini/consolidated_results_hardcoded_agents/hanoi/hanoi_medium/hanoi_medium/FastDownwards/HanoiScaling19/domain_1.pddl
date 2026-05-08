(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk ?d is immediately supported by ?s (a disk or a peg)
    (on ?d - disk ?s - (either disk peg))

    ;; nothing is immediately on ?x (if ?x is a peg this means the peg is empty)
    (clear ?x - (either disk peg))

    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk to an empty peg (destination peg has no disk immediately on it).
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)       ;; disk must be top
      (clear ?to)      ;; destination peg must be empty (no disk immediately on it)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the former immediate-support ?from becomes clear (it lost its top disk)
      (clear ?from)

      ;; destination peg is no longer clear
      (not (clear ?to))

      ;; moved disk is top (clear)
      (clear ?d)
    )
  )

  ;; Move a top disk onto another top disk (destination top must be bigger).
  (:action move-onto-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ;; disk must be top
      (clear ?to)        ;; destination disk must be top
      (smaller ?d ?to)   ;; cannot place larger on smaller
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the former immediate-support ?from becomes clear
      (clear ?from)

      ;; destination top is no longer clear (it now has ?d on it)
      (not (clear ?to))

      ;; moved disk is top (clear)
      (clear ?d)
    )
  )
)