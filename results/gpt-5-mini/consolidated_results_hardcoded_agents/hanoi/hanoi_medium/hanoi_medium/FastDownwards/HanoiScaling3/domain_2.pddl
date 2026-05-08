(define (domain hanoi)
  :requirements :strips :typing :negative-preconditions
  :types disk peg - object step

  :predicates
    (on ?d - disk ?s - object)
    (clear ?o - object)
    (smaller ?d - disk ?o - object)
    (used ?st - step)
    (next ?a - step ?b - step)
    (first ?st - step)
  )

  (:action move-start
    :parameters (?d - disk ?from - object ?to - object ?st - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (first ?st)
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (used ?st)
    )
  )

  (:action move-next
    :parameters (?d - disk ?from - object ?to - object ?prev - step ?st - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (next ?prev ?st)
      (used ?prev)
      (not (used ?st))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (used ?st)
    )
  )
)