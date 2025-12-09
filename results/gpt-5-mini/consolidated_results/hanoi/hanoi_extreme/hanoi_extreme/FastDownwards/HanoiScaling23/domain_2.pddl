(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (succ ?t1 - step ?t2 - step)
    (current ?t - step)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t1 - step ?t2 - step)
    :precondition (and
      (current ?t1)
      (succ ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?t1 - step ?t2 - step)
    :precondition (and
      (current ?t1)
      (succ ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?t1))
      (current ?t2)
    )
  )
)