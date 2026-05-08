(define (domain hanoi)
  :requirements :strips :typing :negative-preconditions
  :types disk peg - place step

  :predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d - disk ?p - place)
    (used ?s - step)
    (next ?a - step ?b - step)
    (first ?s - step)
  )

  (:action move-first
    :parameters (?d - disk ?from - place ?to - place ?st - step)
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
    :parameters (?d - disk ?from - place ?to - place ?prev - step ?st - step)
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