(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg phase)

  (:predicates
    ;; direct-on relations
    (on-peg ?d - disk ?p - peg)     ; ?d is directly on a peg
    (on-disk ?d - disk ?under - disk) ; ?d is directly on another disk

    ;; top-of-stack markers
    (clear-peg ?p - peg)            ; nothing directly on this peg
    (clear-disk ?d - disk)          ; nothing directly on this disk

    ;; static size ordering
    (smaller ?a - disk ?b - disk)

    ;; explicit discrete move-phase control
    (current-phase ?ph - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ;; Move a disk from one peg to a different peg (both source and destination are pegs)
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?ph - phase ?phnext - phase)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
      (not (= ?from ?to))
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

  ;; Move a disk from a peg onto a disk
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

  ;; Move a disk from a disk onto a peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?ph - phase ?phnext - phase)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
      (not (= ?from ?to))
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

  ;; Move a disk from a disk onto another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?ph - phase ?phnext - phase)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
      (not (= ?from ?to))
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