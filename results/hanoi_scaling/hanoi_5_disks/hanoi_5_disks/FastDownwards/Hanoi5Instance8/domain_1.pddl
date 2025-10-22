(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?d2 - disk)

    ;; top/clear indicators
    (clear-disk ?d - disk)    ;; nothing on top of disk ?d
    (clear-peg ?p - peg)      ;; peg ?p currently has no disks directly on it (is empty)

    ;; size ordering: true if first disk is strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk that is directly on a peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)      ;; only top disk can move
      (clear-peg ?to)      ;; destination peg must be empty
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)          ;; source peg becomes empty (top disk left peg)
      (not (clear-peg ?to))      ;; destination peg is no longer empty
    )
  )

  ;; Move a disk that is directly on a peg onto a disk (destination disk must be top and larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?toD - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)        ;; moving disk must be top
      (clear-disk ?toD)      ;; destination disk must be top
      (smaller ?d ?toD)      ;; cannot place larger onto smaller
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?toD)
      (clear-peg ?from)
      (not (clear-disk ?toD))
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is directly on a disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?fromD - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?fromD)
      (clear-disk ?d)      ;; moving disk must be top
      (clear-peg ?to)      ;; destination peg must be empty
    )
    :effect (and
      (not (on-disk ?d ?fromD))
      (on-peg ?d ?to)
      (clear-disk ?fromD)   ;; disk below becomes top
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is directly on a disk onto another disk (destination must be top and larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?fromD - disk ?toD - disk)
    :precondition (and
      (on-disk ?d ?fromD)
      (clear-disk ?d)
      (clear-disk ?toD)
      (smaller ?d ?toD)
    )
    :effect (and
      (not (on-disk ?d ?fromD))
      (on-disk ?d ?toD)
      (clear-disk ?fromD)
      (not (clear-disk ?toD))
      (clear-disk ?d)
    )
  )
)