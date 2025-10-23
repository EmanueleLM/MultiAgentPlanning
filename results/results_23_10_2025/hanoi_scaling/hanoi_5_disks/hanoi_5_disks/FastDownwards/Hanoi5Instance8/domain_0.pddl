(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)

  (:predicates
    ;; Disk placement predicates
    (on-disk ?d - disk ?p - peg)        ;; disk ?d is directly on peg ?p
    (on-disk-d ?d - disk ?d2 - disk)   ;; disk ?d is directly on top of disk ?d2

    ;; Top/clear status indicators
    (clear-disk ?d - disk)             ;; nothing on top of disk ?d
    (clear-peg ?p - peg)               ;; nothing directly on peg ?p

    ;; Size relation: true iff first disk is strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; move a disk that is directly on a peg onto another peg (both pegs must be clear/compatible)
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)      ;; only top disk can move
      (clear-peg ?to)      ;; destination peg has no disk directly on it
      (not (and (= ?from ?to))) ;; source and destination must differ (syntactic safeguard)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)          ;; source peg becomes clear (since the top disk left it)
      (not (clear-peg ?to))      ;; destination peg is no longer clear (disk is now on it)
    )
  )

  ;; move a disk that is directly on a peg onto a disk (respecting size ordering)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?toD - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?toD)
      (smaller ?d ?toD)      ;; cannot place larger disk onto smaller one
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk-d ?d ?toD)
      (clear-peg ?from)
      (not (clear-disk ?toD))
      (clear-disk ?d)
    )
  )

  ;; move a disk that is directly on a disk onto a peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?fromD - disk ?to - peg)
    :precondition (and
      (on-disk-d ?d ?fromD)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk-d ?d ?fromD))
      (on-disk ?d ?to)
      (clear-disk ?fromD)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ;; move a disk that is directly on a disk onto another disk (must be smaller)
  (:action move-disk-to-disk
    :parameters (?d - disk ?fromD - disk ?toD - disk)
    :precondition (and
      (on-disk-d ?d ?fromD)
      (clear-disk ?d)
      (clear-disk ?toD)
      (smaller ?d ?toD)
      (not (and (= ?fromD ?toD))) ;; safeguard
    )
    :effect (and
      (not (on-disk-d ?d ?fromD))
      (on-disk-d ?d ?toD)
      (clear-disk ?fromD)
      (not (clear-disk ?toD))
      (clear-disk ?d)
    )
  )
)