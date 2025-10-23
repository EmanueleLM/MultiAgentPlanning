(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)
  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk directly on a peg
    (on-disk ?d - disk ?s - disk)    ; disk directly on another disk
    (clear-peg ?p - peg)             ; peg has no disk on top
    (clear-disk ?d - disk)           ; disk has no disk on top
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is smaller than d2
  )

  ;; Move top disk from a peg onto another peg
  (:action move_from_peg_to_peg
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

  ;; Move top disk from a peg onto a disk (must be smaller)
  (:action move_from_peg_to_disk
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

  ;; Move top disk from a disk onto a peg
  (:action move_from_disk_to_peg
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

  ;; Move top disk from a disk onto another disk (must be smaller)
  (:action move_from_disk_to_disk
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