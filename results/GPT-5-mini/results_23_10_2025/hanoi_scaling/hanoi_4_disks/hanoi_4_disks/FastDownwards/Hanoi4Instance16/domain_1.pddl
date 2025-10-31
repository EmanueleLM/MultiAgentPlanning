(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)

  (:predicates
    ;; A disk is directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; A disk is directly on another disk
    (on-disk ?d - disk ?s - disk)
    ;; A peg is empty (has no disk on top)
    (clear-peg ?p - peg)
    ;; A disk has nothing on top (is the top disk of its peg/stack)
    (clear-disk ?d - disk)
    ;; size ordering: smaller ?d1 ?d2 means d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move top disk from a peg onto an empty peg
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

  ;; Move top disk from a peg onto another disk (must be smaller)
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

  ;; Move top disk from on top of a disk onto an empty peg
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