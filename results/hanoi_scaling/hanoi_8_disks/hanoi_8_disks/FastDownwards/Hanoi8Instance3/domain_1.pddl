(define (domain hanoi-8)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; A disk directly on top of another disk
    (on-disk ?d - disk ?below - disk)
    ;; A disk directly on a peg
    (on-peg ?d - disk ?p - peg)

    ;; True if no disk is directly on top of this disk
    (clear-disk ?d - disk)
    ;; True if no disk is directly on this peg
    (clear-peg ?p - peg)

    ;; Size relation: strictly smaller ?x ?y means ?x is smaller than ?y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a top disk from one disk to another disk (destination disk must be clear and larger)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ;; after removing ?d, the supporting disk ?from becomes top (clear)
      (clear-disk ?from)
      ;; destination ?to is no longer clear
      (not (clear-disk ?to))
      ;; ?d is still clear (it is the moved top disk)
      (clear-disk ?d)
    )
  )

  ;; Move a top disk from a disk onto a peg (peg must be clear)
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?p - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?p)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?p)
      (clear-disk ?from)
      (not (clear-peg ?p))
      (clear-disk ?d)
    )
  )

  ;; Move a top disk from a peg onto a disk (destination disk must be clear and larger)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  ;; Move a top disk from one peg to another peg (destination peg must be clear)
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )
)