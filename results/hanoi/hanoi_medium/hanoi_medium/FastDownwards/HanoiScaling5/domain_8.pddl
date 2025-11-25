(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object step)

  (:predicates
    (on ?d - disk ?s - object)
    (clear ?o - object)
    (smaller ?d1 - disk ?d2 - disk)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)