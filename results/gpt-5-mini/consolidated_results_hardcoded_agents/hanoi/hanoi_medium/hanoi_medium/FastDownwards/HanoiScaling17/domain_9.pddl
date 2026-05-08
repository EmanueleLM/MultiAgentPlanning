(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg phase)

  (:predicates
    ;; disk location predicates:
    (on-peg ?d - disk ?p - peg)      ;; disk is directly on a peg
    (on-disk ?d - disk ?under - disk) ;; disk is directly on another disk

    ;; top/empty markers:
    (clear-peg ?p - peg)            ;; no disk is directly on this peg
    (clear-disk ?d - disk)          ;; no disk is directly on this disk

    ;; size ordering (static):
    (smaller ?a - disk ?b - disk)   ;; ?a is smaller than ?b

    ;; discrete move phases: enforce exactly one move per phase transition
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
      ;; location updates
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; phase progression
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
      ;; location updates
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; occupancy updates
      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; phase progression
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
      ;; location updates
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; occupancy updates: the disk that was under ?d becomes clear
      (clear-disk ?from)
      (not (clear-peg ?to))

      ;; phase progression
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
      ;; location updates
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; occupancy updates: destination no longer clear, source becomes clear
      (not (clear-disk ?to))
      (clear-disk ?from)

      ;; phase progression
      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )
)