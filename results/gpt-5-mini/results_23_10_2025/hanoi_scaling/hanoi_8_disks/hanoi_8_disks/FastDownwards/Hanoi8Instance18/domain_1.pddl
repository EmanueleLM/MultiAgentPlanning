(define (domain hanoi-8-domain)
  ; Tower of Hanoi domain for 8 disks and 3 pegs.
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; disk-on-disk: disk ?d is directly on top of disk ?s
    (on-disk ?d - disk ?s - disk)
    ; disk-on-peg: disk ?d is directly on top of peg ?p
    (on-peg ?d - disk ?p - peg)

    ; clear-disk ?x : nothing is on top of disk ?x
    (clear-disk ?x - disk)
    ; clear-peg ?p : peg ?p has no disks on it (i.e., empty)
    (clear-peg ?p - peg)

    ; size ordering: smaller ?a ?b true iff disk a is strictly smaller than disk b
    (smaller ?a - disk ?b - disk)
  )

  ; Move a top disk from a peg onto another peg.
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
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk from a disk onto another peg.
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
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk from a peg onto a disk (only allowed if moved disk is smaller).
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
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  ; Move a top disk from a disk onto another disk (only allowed if moved disk is smaller).
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
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )
)