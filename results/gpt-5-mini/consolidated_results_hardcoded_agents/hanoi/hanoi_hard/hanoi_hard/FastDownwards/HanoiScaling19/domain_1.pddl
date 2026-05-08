(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)

  (:predicates
    ; A disk is directly on a peg
    (on-peg ?d - disk ?p - peg)
    ; A disk is directly on another disk
    (on-disk ?d - disk ?b - disk)
    ; The top of a peg is empty (no disk on that peg)
    (clear-peg ?p - peg)
    ; A disk has nothing on top of it
    (clear-disk ?d - disk)
    ; Size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ; Move a top disk that sits on a disk to another disk (stacking)
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
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )

  ; Move a top disk that sits on a disk to a peg (making that peg non-empty)
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
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk that sits on a peg to another peg
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
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk that sits on a peg to a disk (stacking onto a disk)
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
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )
)