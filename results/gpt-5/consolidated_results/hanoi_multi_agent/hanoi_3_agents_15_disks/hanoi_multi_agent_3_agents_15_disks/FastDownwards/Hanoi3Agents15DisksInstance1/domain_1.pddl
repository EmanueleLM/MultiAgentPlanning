(define (domain hanoi-3pegs-15disks)
  (:requirements :strips :typing)
  (:types disk peg)
  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)
    (on ?x - disk ?y - object)
    (clear ?z - object)
    (smaller ?d1 - disk ?d2 - disk)
    (can-stack ?d - disk ?s - object)
  )

  (:action move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (can-stack ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)