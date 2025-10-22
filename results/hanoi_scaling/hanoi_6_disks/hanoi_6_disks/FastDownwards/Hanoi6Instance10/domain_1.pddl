(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk placement: a disk can be directly on a peg or directly on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?d2 - disk)

    ;; topness / emptiness markers
    (clear-disk ?d - disk)   ;; true when there is no disk above ?d
    (clear-peg ?p - peg)     ;; true when peg has no disk on it (empty)

    ;; static size ordering: true if ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that is directly on a peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ;; remove from source peg
      (not (on-peg ?d ?from))
      ;; place on destination peg
      (on-peg ?d ?to)
      ;; source peg becomes empty
      (clear-peg ?from)
      ;; destination peg no longer empty
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk
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
      ;; source peg becomes empty
      (clear-peg ?from)
      ;; destination disk now has a disk on top, so not clear
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk that is on another disk onto an empty peg
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
      ;; the disk that was below becomes clear (no disk on top)
      (clear-disk ?from)
      ;; destination peg no longer empty
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is on another disk onto another top disk
  (:action move-disk-to-disk
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
      ;; disk below becomes clear
      (clear-disk ?from)
      ;; destination disk no longer clear
      (not (clear-disk ?to))
    )
  )
)