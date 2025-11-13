(define (domain hanoi-3pegs-15disks)
  (:requirements :strips :typing)
  (:types disk peg)
  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)
    (on ?x - disk ?y - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?z - object)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)