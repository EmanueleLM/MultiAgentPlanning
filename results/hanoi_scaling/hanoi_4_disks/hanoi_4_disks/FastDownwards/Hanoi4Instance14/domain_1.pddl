(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk directly on another disk
    (on-disk ?d - disk ?support - disk)
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; this disk has nothing on top of it (it is the top of its stack)
    (clear-disk ?d - disk)
    ;; peg has nothing on it (empty)
    (clear-peg ?p - peg)
    ;; size ordering: ?small is strictly smaller than ?large
    (smaller ?small - disk ?large - disk)
  )

  ;; Move a top disk that is directly on a disk to sit on top of another disk (must be smaller than destination)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; remove old support link and add new support link
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk below (?from) becomes clear (now top)
      (clear-disk ?from)

      ;; the destination disk is no longer clear (now has ?d on top)
      (not (clear-disk ?to))

      ;; the moved disk is now the top disk (clear)
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk below (?from) becomes clear (now top)
      (clear-disk ?from)

      ;; destination peg is no longer clear
      (not (clear-peg ?to))

      ;; the moved disk is now the top disk (clear)
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a peg to sit on top of another disk (must be smaller)
  (:action move-peg-to-disk
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

      ;; source peg becomes clear (now empty)
      (clear-peg ?from)

      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk is now top (clear)
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes clear (now empty)
      (clear-peg ?from)

      ;; destination peg is no longer clear
      (not (clear-peg ?to))

      ;; moved disk is now top (clear)
      (clear-disk ?d)
    )
  )
)