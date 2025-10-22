(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk d is directly on disk b (d is immediately above b)
    (on-disk ?d - disk ?b - disk)
    ;; disk d is directly on peg p (d is the topmost disk on peg p)
    (on-peg  ?d - disk ?p - peg)
    ;; nothing is on top of disk d
    (clear-disk ?d - disk)
    ;; peg p is empty (has no disks)
    (clear-peg  ?p - peg)
    ;; ordering relation: ?s is strictly smaller than ?b
    (smaller ?s - disk ?b - disk)
  )

  ;; Move a top disk that is directly on a peg to an empty peg
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
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
    )
  )

  ;; Move a top disk that is directly on a peg to sit atop another clear disk (only if smaller)
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
      (not (clear-disk ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk that is directly on another disk to sit atop a different clear disk (only if smaller)
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
      (not (clear-disk ?to))
      (clear-disk ?from)
    )
  )
)