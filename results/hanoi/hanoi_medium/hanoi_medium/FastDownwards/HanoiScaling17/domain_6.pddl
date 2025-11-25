(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg phase)

  (:predicates
    ;; disk placement relations
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on a peg
    (on-disk ?d - disk ?under - disk); ?d is directly on another disk

    ;; top-of-stack / empty markers
    (clear-peg ?p - peg)              ; nothing directly on this peg
    (clear-disk ?d - disk)            ; nothing directly on this disk

    ;; static size ordering (grounded once in problem)
    (smaller ?a - disk ?b - disk)

    ;; explicit discrete move-phase control
    (current-phase ?ph - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Move a disk that is directly on a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?ph - phase ?phnext - phase)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?ph - phase ?phnext - phase)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?ph - phase ?phnext - phase)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )

  ;; Move a disk that is directly on one disk onto another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?ph - phase ?phnext - phase)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )
)