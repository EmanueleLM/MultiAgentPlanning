(define (domain hanoi_2agents_20_disks)
  (:requirements :strips :typing)
  (:types
    support
    disk peg - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?x - support)
    (smaller ?x - disk ?y - disk)
    (ok-stack ?x - disk ?y - support)
    (on-peg ?x - disk ?p - peg)
    (clear-peg ?p - peg)
  )
  (:action move
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (clear ?d)
      (clear ?to)
      (on ?d ?from)
      (ok-stack ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)