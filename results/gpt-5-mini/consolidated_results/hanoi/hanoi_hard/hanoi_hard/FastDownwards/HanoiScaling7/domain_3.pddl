(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    (on ?d - disk ?p - (either disk peg))
    (clear ?p - (either disk peg))
    (larger ?big - disk ?small - disk)
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (now ?t))
      (now ?t2)
    )
  )
)