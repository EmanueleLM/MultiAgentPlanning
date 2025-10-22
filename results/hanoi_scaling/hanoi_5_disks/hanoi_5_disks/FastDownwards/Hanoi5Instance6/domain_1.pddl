(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk ?d is directly on peg ?p
    (on-peg ?d - disk ?p - peg)
    ;; disk ?d is directly on top of disk ?support
    (on-disk ?d - disk ?support - disk)
    ;; no disk on top of ?d (so ?d is movable)
    (clear ?d - disk)
    ;; peg ?p has no disks on it
    (clear-peg ?p - peg)
    ;; ?d1 is strictly larger than ?d2
    (bigger ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk from an empty peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk from a peg onto another (larger) disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (bigger ?to ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk from a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear ?from)
    )
  )

  ;; Move a top disk from one disk onto another (larger) disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear ?d)
      (clear ?to)
      (bigger ?to ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)