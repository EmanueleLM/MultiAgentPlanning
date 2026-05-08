(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - (either peg disk))
    (clear ?p - (either peg disk))
    (smaller ?d1 - disk ?d2 - disk)
    (stage ?s - step)
    (next ?s - step ?s2 - step)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
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
      (not (stage ?s))
      (stage ?s2)
    )
  )
)